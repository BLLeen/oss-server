docker stop oss-server
docker rm oss-server
docker run -d --name oss-server -v /Users/qudian/Documents/oss-server-volum:/oss --network host -p 18080:18080 oss-server:dev