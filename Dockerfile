FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /ssgl

WORKDIR /ssgl

COPY Gemfile /ssgl/Gemfile
COPY Gemfile.lock /ssgl/Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . /ssgl