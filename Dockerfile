FROM mysql:5.7.18
MAINTAINER Mouhamed Fall <mouhamed.fall@b-com.com>

ADD oai_db.sql /docker-entrypoint-initdb.d

ADD start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ./start.sh
