# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Command.create!(
  body: "git add",
  description: "ファイルをステージングエリアにあげる"
)

Command.create!(
  body: "git branch",
  description: "ブランチ一覧表示"
)

Command.create!(
  body: "git checkout -b [ブランチ名]",
  description: "ブランチを作成してカレントブランチにする"
)

Command.create!(
  body:  "git checkout [ブランチ名]",
  description:  "ブランチの切り替え"
)

Command.create!(
  body: "git log",
  description: "Gitログ表示"
)

Command.create!(
  body: "git log --oneline",
  description: "Gitログを完結にまとめて表示"
)

Command.create!(
  body: "docker compose build",
  description: "Dockerイメージのビルド"
)

Command.create!(
  body: "docker compose up",
  description: "コンテナの起動" 
)

Command.create!(
  body: "docker compose exec web bundle install",
  description:  " Gemのインストール"
)

Command.create!(
  body: "docker compose exec web yarn install", 
  description: " node_modulesのインストール" 
)

Command.create!(
  body: "docker compose exec web rails db:create", 
  description: "データベースの作成"
)

Command.create!(
  body:  "docker compose exec web rails db:migrate",  
  description: "マイグレーションファイルの適応"
)

Command.create!(
  body: "docker compose down", 
  description:  "Dockerコンテナの終了"
)

Command.create!(
  body: "cd", 
  description: "現在のディレクトリの変更" 
)

Command.create!(
  body: "pwd", 
  description: "現在のディレクトリの表示" 
)

Command.create!(
  body: "mkdir", 
  description:  "ディレクトリの作成" 
)

Command.create!(
  body: "rm", 
  description:  "ファイルやディレクトリの削除" 
)

Command.create!(
  body:  "touch", 
  description:  "空ファイルの作成" 
)
