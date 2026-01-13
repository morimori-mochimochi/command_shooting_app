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

ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

ENV RAILS_ENV=production
# ビルド時にはDB接続が不要なため、ダミーの値を渡して assets:precompile を実行する
# SECRET_KEY_BASEも同様にダミーでよい
RUN SECRET_KEY_BASE=dummy DATABASE_URL=postgresql://dummy:dummy@dummy/dummy bundle exec rails assets:precompile

# コンテナ起動時(実行時)にDBの準備を行い、サーバーを起動する
# tmp/pids/server.pid のパスも修正
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails db:prepare && bundle exec rails s -b 0.0.0.0 -p 3000"]
