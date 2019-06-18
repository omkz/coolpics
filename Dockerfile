FROM ruby:2.5.5-alpine

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apk add --update build-base postgresql-dev tzdata nodejs yarn

RUN mkdir /vid
WORKDIR /vid

COPY Gemfile /vid/Gemfile
COPY Gemfile.lock /vid/Gemfile.lock

RUN bundle install
RUN yarn install

COPY . /vid

