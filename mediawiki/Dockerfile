FROM mediawiki:stable

USER root

# 将代理破解包加入容器
COPY "LocalSettings.php" /var/www/html/

# 设置启动加载代理包
RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/jira/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/jira/bin/setenv.sh
