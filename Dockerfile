FROM elixir:lastest

MAINTAINER Hamza Shahid <hamza@shahid.com.au>

RUN mix local.hex --force

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN mix local.rebar --force

WORKDIR /app