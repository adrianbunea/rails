FROM arm64v8/ruby

LABEL Name=rails Version=0.0.1

RUN apt-get update
RUN apt-get -y install sqlite3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY ./blog /app

RUN bundle install

EXPOSE 3000