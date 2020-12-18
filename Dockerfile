FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /Uni_Chann_3
WORKDIR /Uni_Chann_3

COPY Gemfile /Uni_Chann_3/Gemfile
COPY Gemfile.lock /Uni_Chann_3/Gemfile.lock

RUN bundle install
COPY . /Uni_Chann_3