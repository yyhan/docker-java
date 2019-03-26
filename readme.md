java docker 镜像。

# 依赖

基础镜像： [debian:stretch-slim](https://hub.docker.com/_/debian)

额外依赖：
+ [jdk 8u202](https://www.oracle.com/technetwork/java/javase/downloads/index.html)

# 环境变量

| 名称 | 值 |
| ------ | ------ |
| JAVA_HOME | /usr/local/jdk1.8.0_202 |
| JRE_HOME | $JAVA_HOME/jre |


# 构建

## 本地构建

+ 首先到 [java 官网](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 下载 `linux x64` 版本的 jdk，并放到 `jdk` 目录下；
+ 运行以下命令：

```sh

# 私有仓库地址
DOCKER_REGISTRY_SERVER=<仓库地址>
# 镜像版本
docker_image_version=1.8.0_202

docker build -t java:1.8.0_202:$docker_image_version .

# 私有仓库地址
DOCKER_REGISTRY_SERVER=<仓库地址>
# 镜像版本
docker_image_version=1.8.0_202

# 构建镜像
docker build -t $DOCKER_REGISTRY_SERVER/java:$docker_image_version .

# 推送到远程仓库
docker push $DOCKER_REGISTRY_SERVER/java:$docker_image_version

# 添加 latest 标签
docker tag $DOCKER_REGISTRY_SERVER/java:$docker_image_version $DOCKER_REGISTRY_SERVER/java

# 推送 latest 的远程仓库
docker push $DOCKER_REGISTRY_SERVER/java
```
