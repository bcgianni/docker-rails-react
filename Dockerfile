FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /backend-app
WORKDIR /backend-app
COPY Gemfile /backend-app/Gemfile
COPY Gemfile.lock /backend-app/Gemfile.lock
RUN bundle install
COPY . /backend-app
