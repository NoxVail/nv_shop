FROM ruby:2.7.5
RUN apt update && apt install -qq -y wget git ruby-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install -y nodejs
RUN npm -g i yarn
RUN wget https://github.com/Shopify/shopify-cli/releases/download/v2.15.0/shopify-cli-2.15.0.deb
RUN apt install -qq -y /shopify-cli-2.15.0.deb
RUN rm /shopify-cli-2.15.0.deb
