FROM ruby:3.4.2

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client && npm install -g yarn

# 作業ディレクトリ作成
WORKDIR /app

# Gemfileをコピーしてbundle install
COPY ./Gemfile ./Gemfile.lock ./
RUN bundle install

# アプリコードをコピー
COPY . .

# ポート解放
EXPOSE 3000

ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

ENV RAILS_ENV=production
RUN bundle exec rails assets:precompile
RUN bundle exec rails db:prepare

CMD ["bash", "-c", "rm -f temp/pids/server.pid && RAILS_ENV=production bundle exec rails s -b 0.0.0.0 -p 3000"]
