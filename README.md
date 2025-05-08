一、Install

主机上需要安装 docker-compose、nvidia-docker2或nvidia-container-runtime、docker以及nvidia-container-toolkit

git clone ${http_url}

下载后，进入代码目录，

$cd  ComfyUI_docker_compose

因下载模型需要，国内用户需要科学上网，修改Dockerfile

![image](https://github.com/user-attachments/assets/73c0788f-d99f-4c1c-a61a-99efc9bba3a0)


最后，运行如下命令，等待模型节点自动下载和服务启动（磁盘预留100G）

$docker compose up -d

二、update

在原代码目录中运行

$git pull

然后重启容器即可

$docker compose restart


注意：一些类型的GPU不支持cuda-malloc，会有如下启动提示，此时在容器中使用start.sh_old覆盖start.sh，并重启容器即可,此类型GPU出图会比较慢。
