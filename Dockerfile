FROM ruby:2.2.10-alpine

WORKDIR /service

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    g++ \
    linux-headers \
    make \
    musl-dev \
    git
RUN apk add --no-cache \
    mysql-dev \
    imagemagick \
    ghostscript-fonts \
    nodejs \
    tzdata
#ADD Gemfile Gemfile
#ADD Gemfile.lock Gemfile.lock
#ADD vendor vendor
# RUN bundle install \
#    --clean \
#    --deployment \
#    --gemfile ./Gemfile \
#    --jobs=3 \
#    --local \
#    --without development test
#RUN apk del .build-deps
#ADD ["./", "./"]
#RUN bundle exec rake assets:precompile