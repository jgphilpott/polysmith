FROM docker.pkg.github.com/jgphilpott/docker-images/flask-pack-mini:v4

ADD . /root

WORKDIR /root

CMD ["python3", "app/root.py"]
