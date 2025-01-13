FROM ubuntu:22.04
RUN apt update
RUN apt install gcc -y
RUN apt install build-essential git  libgl1 libgl1-mesa-glx ffmpeg libglib2.0-0 libsm6 libxrender1 libxext6 wget -y

# py 环境
RUN apt install python3-venv -y
#设置容器启动后代理地址
ENV https_proxy http://xxxx
ENV no_proxy mirrors.xxxx.com
#设置kimi环境变量
export api_key=sk-xxxxxx
export api_version=
export api_base=https://api.moonshot.cn/v1
export api_proxy=
export api_model=moonshot-v1-8k

#启动文件
COPY start.sh start.sh_old /Comfyui/

#启动服务
CMD ["bash", "/Comfyui/start.sh"]
