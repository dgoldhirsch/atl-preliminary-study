FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_8.x |   bash -
RUN  apt-get install -y build-essential nodejs
RUN mkdir -p /app
WORKDIR /app
ADD Gemfile* ./
RUN gem install bundler && bundle install
ADD . ./
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
