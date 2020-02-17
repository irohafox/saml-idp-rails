FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential mysql-client vim
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install yarn
RUN groupadd -r --gid 1000 rails && useradd -m -r --uid 1000 --gid 1000 rails
RUN mkdir /saml-idp-rails
RUN chown -R rails:rails /saml-idp-rails
USER rails
WORKDIR /saml-idp-rails
ADD . /saml-idp-rails
