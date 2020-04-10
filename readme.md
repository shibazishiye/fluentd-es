# 在Docker中部署EFK

将Elasticsearch、Fluentd和Kiabana部署在Docker中，在Docker中部署的应用的日志会发送到Fluentd，并最终发送到Elasticsearch，然后通过Kiabana的Web界面查看。

- - -

# 使用步骤

## 构建启用了Elasticsearch插件的Fluentd

- 拉取fluentd最新Image：
> docker pull fluent/fluentd:v1.10.1-debian-1.0

- 到目录fluentd下执行Image构建命令：
> docker build --tag ydx/fluentd-elasticsearch:latest .

- - -

## 拉取最新的Elasticsearch和Kiabana的Images

> docker pull elasticsearch:7.6.2
> docker pull kibana:7.6.2

- - -

## 使用Docker Compose脚本启动

> docker-compose up 

- - -

## 单独启动Fluentd

使用脚本[`start_fluentd_docker.sh`](start_fluentd_docker.sh)单独启动Fluentd。如果Elasticsearch不在相同的节点，需要修改文件[`fluentd/conf/fluentd.conf`](fluentd/conf/fluentd.conf)中host对应的参数。

- - -

## 应用发送日志到Fluentd

参考以下命令启动应用：
> docker run --log-driver=fluentd --log-opt tag="docker.{.ID}}" ubuntu echo 'Hello Fluentd!'
其中参数log-driver=fluentd表示将日志发送到fluentd。

- - -

## 应用的日志配置
各应用应将日志配置为输出到系统的标准输出STDOUT，这样日志就能发送到fluentd，并最终发送的Elasticsearch。

- - -

## 查看日志

访问Kiabana首页：[`http://localhost:5601/`](http://localhost:5601/)， 在左侧Tab上选择Discover，创建fluentd-*的索引。此后来自Fluentd的日志都会显示在此索引下。



