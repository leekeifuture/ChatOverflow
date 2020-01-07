#!usr/bin/env/ bash
# run it from source directory "bash scripts/deploy.sh"

echo 'mvn clean package'

mvn clean package

echo 'Copying files...'

scp -vi $KEY_PATH $JAR_LOCAL_PATH $SERV_IP:$JAR_SERV_PATH

echo 'Restarting server...'

ssh -vi $KEY_PATH $SERV_IP <<EOF

pgrep java | xargs kill -9;
nohup java -jar $JAR_SERV_PATH >> $PROJECT_PATH/log.txt &

EOF

echo 'Bye...'
