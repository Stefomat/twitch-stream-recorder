FROM python:3.11.3-alpine3.17

RUN apk add --no-cache tini=0.19.0-r1

RUN apk add --no-cache ffmpeg=5.1.2-r1

RUN python -m pip install --no-cache-dir --upgrade streamlink==5.3.1

COPY twitch-recorder.py /opt/

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/tini", "--", "python", "/opt/twitch-recorder.py"]
