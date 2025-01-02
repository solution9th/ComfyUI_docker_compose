FROM ubuntu:22.04
RUN apt update
RUN apt install gcc -y
RUN apt install build-essential git  libgl1 libgl1-mesa-glx ffmpeg libglib2.0-0 libsm6 libxrender1 libxext6 wget -y

# py 环境
RUN apt install python3-venv -y
ENV https_proxy http://xxxx
ENV no_proxy mirrors.xxxx.com
ENV PATH=/Comfyui/venv/bin:$PATH
ENV PYTHONPATH=/Comfyui/venv/lib/python3.10:$PYTHONPATH
ENV LD_LIBRARY_PATH=/Comfyui/venv/lib/python3.10:$LD_LIBRARY_PATH
COPY start.sh models.txt custom_nodes.txt /Comfyui/

#启动服务
CMD ["bash", "/Comfyui/start.sh"]
