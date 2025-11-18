FROM node:20-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 安装Qwen-code
RUN npm install -g @qwen-code/qwen-code@latest

# 从ghcr.io/astral-sh/uv:latest镜像复制uv和uvx
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

# 创建并设置工作目录
WORKDIR /app
COPY . /app

# 使用uv安装项目依赖（基于pyproject.toml中的配置）
RUN uv sync

# 配置bashrc，使其在每次启动终端时自动激活虚拟环境
RUN echo 'source /app/.venv/bin/activate' >> /root/.bashrc
# 设置清华pypi镜像
RUN echo 'pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple' >> /root/.bashrc
# 设置默认Shell为bash
RUN ln -sf /bin/bash /bin/sh

# 暴露8888端口
EXPOSE 8888

# 设置工作目录为/app/workspace
WORKDIR /app/workspace

# 设置启动命令，先激活虚拟环境，然后运行Jupyter Lab
CMD ["/bin/bash", "-c", "source /app/.venv/bin/activate && python -m jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.token='' --ServerApp.allow_origin='*' --ServerApp.allow_remote_access=True"]
