FROM ruby:2.3-alpine

WORKDIR /home/app/rails-app

RUN apk --update add ca-certificates nodejs tzdata nginx libcurl && \
    apk --update add --virtual .builddeps build-base ruby-dev libc-dev linux-headers mysql-dev libxml2-dev libxslt-dev git &&\
    addgroup -g 1000 -S app && adduser -u 1000 -S app -G app &&\
    bundle config mirror.https://rubygems.org https://gems.ruby-china.com

COPY . /home/app/rails-app
RUN bundle install --without development test --path vendor/bundle

CMD  ["bundle", "exec", "rails", "s"]
