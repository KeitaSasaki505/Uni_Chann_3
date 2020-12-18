FROM ruby:2.6.5
RUN apt-get update && apt-get install -y \
    build-essential \
    node.js
WORKDIR /Uni_Chann_3
COPY Gemfile Gemfile.lock /Uni_Chann_3/
RUN bundle install