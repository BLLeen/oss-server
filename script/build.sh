#!bin/bash
docker rmi oss-server:dev
docker build .. -t oss-server:dev
docker run -d --name oss-server -v /Users/qudian/Documents/oss-server-volum:/oss -p 18080:18080 oss-server:dev