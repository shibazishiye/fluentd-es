docker run -p 24224:24224 -v ./fluentd/conf:/fluentd/etc -e FLUENTD_CONF=fluentd.conf ydx/fluentd-elasticsearch:latest &
 
