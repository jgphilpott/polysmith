FROM docker.pkg.github.com/jgphilpott/docker-images/flask-pack:v4

ADD . /root

WORKDIR /root

CMD ["python3", "app/root.py"]
