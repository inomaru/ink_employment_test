FROM ruby:3.0.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs
RUN mkdir /src
WORKDIR /src
ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock
RUN bundle install
ADD . /src
ENTRYPOINT [ "/src/startup.sh" ]
EXPOSE 3000