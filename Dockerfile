FROM ubuntu:24.04
RUN apt update
RUN apt install -y build-essential git curl libz-dev libyaml-dev
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN /root/.rbenv/bin/rbenv install 3.3.1
RUN /root/.rbenv/bin/rbenv global 3.3.1
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN /root/.rbenv/shims/bundle install
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get install -y tzdata
CMD /root/.rbenv/shims/rspec test.rb
