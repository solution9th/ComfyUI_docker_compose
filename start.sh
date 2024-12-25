#!/bin/bash
if [ ! -f "/Comfyui/main.py" ]; then
	cd /Comfyui && python3 -m venv venv
	export PYTHONPATH=/Comfyui/venv/lib/python3.10/site-packages:$PYTHONPATH 
	git clone --branch v0.3.0 https://github.com/comfyanonymous/ComfyUI.git /opt/ComfyUI
	cp -a /opt/ComfyUI/*  /Comfyui/ && rm -rf /opt/ComfyUI && cd /Comfyui && pip3 install -r  requirements.txt && pip3 install wget


else
	echo "Comfyui 已安装"
	export PYTHONPATH=/Comfyui/venv/lib/python3.10/site-packages:$PYTHONPATH 
	cd /Comfyui && python3 -m venv venv
fi
# 检查并克隆指定节点
echo "检查节点安装情况"
while IFS=' ' read -r custom_node_url costom_node_name; do
    echo $costom_node_name
    if [ ! -d "/Comfyui/custom_nodes/${costom_node_name}" ]; then
      echo "$costom_node_name 节点不存在，正在克隆..."
      git clone $custom_node_url /Comfyui/custom_nodes/$costom_node_name
      # 检查并安装requirements.txt
      if [ -f "/Comfyui/custom_nodes/$costom_node_name/requirements.txt" ]; then
        echo "安装 $costom_node_name 的依赖..."
        pip3 install -r "/Comfyui/custom_nodes/${costom_node_name}/requirements.txt"
      fi
    else
      echo "${costom_node_name} 节点已存在"
    fi
  done < /Comfyui/custom_nodes.txt

# 检查并下载模型
echo "检查模型下载情况"
while IFS=' ' read -r model_url model_name; do
    echo ${model_name}
    if [ ! -f "/Comfyui/$model_name" ]; then
      echo "$model_name 模型不存在，正在下载..."
      path="${model_name%/*}"  # 获取路径部分 
      if [ ! -d "/Comfyui/$path" ]; then
	      mkdir -p /Comfyui/$path
      fi
      wget "$model_url" -O "/Comfyui/$model_name"
    else
      echo "$model_name 模型已存在"
    fi
  done < /Comfyui/models.txt

#启动服务
cd /Comfyui &&  python3 main.py --listen --port 443
