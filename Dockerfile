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

#ENV RAILS_ENV production

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD vendor vendor
RUN bundle install \
    --clean \
    --deployment \
    --gemfile ./Gemfile \
    --jobs=3
#    --without development test
RUN apk del .build-deps
ADD ["./", "./"]
RUN cp config/database.yml.example config/database.yml
RUN cp config/currencies.yml.example config/currencies.yml
RUN cp config/markets.yml.example config/markets.yml
RUN bundle exec rake assets:precompile