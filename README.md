一、Install
主机上需要安装 docker-compose、nvidia-docker2或nvidia-container-runtime、docker

git clone ${http_url}

下载后，进入代码目录，

$cd  ComfyUI_docker_compose

因下载模型和节点需要，国内用户需要科学上网，修改Dockerfile

![image](https://github.com/user-attachments/assets/73c0788f-d99f-4c1c-a61a-99efc9bba3a0)


最后，运行如下命令，等待模型节点自动下载和服务启动（磁盘预留100G）

$docker compose up -d
