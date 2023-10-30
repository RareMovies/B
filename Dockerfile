FROM mysterysd/wzmlx:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY naveen.txt .
RUN pip3 install --no-cache-dir -r naveen.txt
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo

RUN apt-get -y clean
RUN apt-get -y autoremove

COPY . .

CMD ["bash", "start.sh"]
