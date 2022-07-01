FROM ruby:3.0.4-alpine

WORKDIR /app
COPY Gemfile Gemfile.lock /app/

RUN apk add --no-cache -t .build-dependencies \
    alpine-sdk \
    build-base \
    mysql-client \
 && apk add --no-cache \
    bash \
    mysql-dev \
    nodejs \
    tzdata \
    yarn \
    git \
 && gem install bundler \
 && gem install rails -v 7.0.2 \
 && bundle install \
 && apk del --purge .build-dependencies

COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
