FROM heroku/heroku:18

RUN mkdir -m 777 /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh
ADD config.json /v2raybin/config.json
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
