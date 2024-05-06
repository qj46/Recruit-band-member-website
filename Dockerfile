# ベースイメージを指定
FROM ruby:3.2.2

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# 作業ディレクトリを設定
WORKDIR /var/www

COPY ./ ./

# Gemのインストール
RUN bundle install

# データベースの作成
RUN rails db:create

# ポートのエクスポート
EXPOSE 3000

# サーバーの起動
CMD rm -f tmp/pids/server.pid && rails server -b 0.0.0.0
