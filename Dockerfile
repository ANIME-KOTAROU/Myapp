# syntax = docker/dockerfile:1

# Ruby バージョンは .ruby-version と合わせる
ARG RUBY_VERSION=3.2.9
FROM docker.io/library/ruby:$RUBY_VERSION-slim

# 作業ディレクトリ
WORKDIR /rails

# 必要パッケージをインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    build-essential \
    git \
    libpq-dev \
    pkg-config \
    libyaml-dev\
    libvips \
    postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# 開発環境の設定
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Gemfile と Gemfile.lock をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリコードをコピー
COPY . .

# bin/rails や bin/setup が実行できるように
RUN chmod +x bin/*

# ポート公開
EXPOSE 3000

# デフォルトコマンド（rails s）
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
