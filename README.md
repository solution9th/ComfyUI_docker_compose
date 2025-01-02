主机上需要安装 docker-compose、nvidia-docker2或nvidia-container-runtime、docker

git clone ${http_url}

下载后，进入代码目录，

$cd  ComfyUI_docker_compose

修改Dockerfile，在配置中添加翻墙代理地址

![image](https://github.com/user-attachments/assets/73c0788f-d99f-4c1c-a61a-99efc9bba3a0)


运行

$docker compose up -d
