FROM jgphilpott/flask-pack:base

ADD . /root
WORKDIR /root

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh \
    && npm install --global coffeescript \
    && npm install --global typescript \
    && npm install --global uglify-js \
    && npm install --global node-sass

CMD python3 app/root.py