FROM ruby:3.4

# RUN  apt remove cmdtest
# RUN  apt remove yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN  apt-get update
RUN apt-get install apt-utils

RUN  apt-get install  -y nodejs postgresql-client yarn
RUN yarn add tailwindcss
RUN yarn add esbuild

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock yarn.lock /app/
RUN bundle install && yarn install
COPY . /app

RUN bundle update --bundler