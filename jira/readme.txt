1、将编译破解版docker镜像
docker build -t jira:latest .

2、启动容器
docker run -d --name jira\
  --restart always \
  -p 18009:8080 \
  -e TZ="Asia/Shanghai" \
  -m 4096M \
  -v /Users/xuhj/Documents/Docker/data/jira:/var/atlassian/jira \
  jira:latest

3、生成许可
java -jar atlassian-agent.jar \
  -d -m xuhj2015@foxmail.com \
  -n xuhj2015 \
  -p jira \
  -o xuhj2015 \
  -s BRQE-TEN6-TLYV-KFMI
