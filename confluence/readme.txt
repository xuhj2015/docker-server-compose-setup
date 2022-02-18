1、将编译破解版docker镜像
docker build -t confluence:latest .

2、启动容器
docker run -d --name confluence\
  --restart always \
  -p 18008:8090 \
  -e TZ="Asia/Shanghai" \
  -m 4096M \
  -v /Users/xuhj/Documents/Docker/data/confluence:/var/atlassian/confluence \
  confluence:latest

3、生成许可
java -jar atlassian-agent.jar \
  -d -m xuhj2015@foxmail.com \
  -n xuhj2015 \
  -p jira \
  -o xuhj2015 \
  -s B1AX-ZG90-TZ4F-9O29
