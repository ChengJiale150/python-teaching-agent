# Python教学Agent

这是一个专注于Python教学的Jupyter Notebook生成Agent项目，旨在为Python课程设计结构化、交互式的课后辅助学习Notebook。

## 项目概述

本项目通过容器化技术提供了一个完整的Python学习环境，集成了Jupyter Lab和多种数据科学常用库，支持生成高质量的交互式学习材料。Agent能够将Python库的知识点拆解为"理论讲解-代码演示-即时练习"的闭环，帮助学生更好地理解和应用Python知识。

## 核心功能

- **结构化Notebook生成**：自动创建符合教学逻辑的Jupyter Notebook，包含6大核心模块
- **交互式学习环境**：提供完整的Jupyter Lab环境，支持代码实时运行和结果展示
- **数据科学工具集**：集成pandas、scikit-learn、matplotlib等常用数据科学库
- **容器化部署**：通过Docker实现环境的一致性和便捷部署

## 安装与部署

### 使用Docker部署(推荐)

#### 方法一：从Docker Hub拉取镜像（推荐）

1. 确保已安装Docker
2. 拉取预构建的Docker镜像：
   ```bash
   docker pull chengjiale150/python-teaching-agent:latest
   ```
3. 运行容器：
   ```bash
   docker run -p 8888:8888 chengjiale150/python-teaching-agent:latest
   ```
4. 在浏览器中访问 `http://localhost:8888` 打开Jupyter Lab

#### 方法二：本地构建Docker镜像

1. 确保已安装Docker
2. 克隆项目仓库
3. 构建Docker镜像：
   ```bash
   docker build -t python-teaching-agent .
   ```
4. 运行容器：
   ```bash
   docker run -p 8888:8888 python-teaching-agent
   ```
5. 在浏览器中访问 `http://localhost:8888` 打开Jupyter Lab

## 使用说明

1. **创建Notebook**：在Jupyter Lab中创建新的Python Notebook
2. **生成教学内容**：使用Agent功能生成结构化的教学Notebook
3. **交互式学习**：按照生成的Notebook进行学习，运行代码并完成练习

### Notebook核心模块

生成的Notebook包含以下6个核心模块：

1. **学习导航模块**：明确学习目标、前置知识与工具准备
2. **核心知识模块**：拆解库的核心知识点，按「基础→进阶」分层
3. **实战应用模块**：结合课程场景设计小型项目，强化知识应用
4. **交互式练习模块**：让学生自主编码，检验学习效果
5. **知识总结模块**：梳理核心知识点，形成知识框架
6. **扩展资源模块**：提供额外学习材料，满足不同学生需求