# アプリ構想メモ：コマンド早撃ちランク付けアプリ

## 1. アプリの目的

- プログラミング初学者向けに、**コマンド入力の反復練習と反射速度測定**を兼ねたWebアプリ。
- 練習とゲーム性を組み合わせ、**記憶定着・達成感・競争性**を提供する。

---
##  . 画面遷移構想案

[トップページ]
   ↓ スタートクリック
[スタンバイ画面]
   ↓ get set クリック　（Go!）表示
[問題ページ]　
   ↓ 回答完了
[結果ページ]
   ↓
[再挑戦] or [トップへ] or [ランキング] or [ログイン] 


[ランキングページ]
   ← トップ or 結果ページから遷移


[ログインページ]
　　← トップ、結果ページから遷移
    ↓
[新規登録ページ] o
　　← ログインページから遷移 o
　　　登録後は自動的にログイン
    ↓
[スタンバイページ]

## デザイン案

- トップページ
  - 遊ぶ　ボタン
  - ログイン　ボタン

- スタンバイページ
  - 'ゲームの説明'
  - get set ボタン
    - GO!　表示
 
- プレイページ
  - 経過時間
  - 問題
  - 説明
  - 入力フォーム
  - ストップ　ボタン

- 結果ページ
  - 'ただいまのタイム'
    - タイム表示
  - ログイン前 'あなたの結果は...'
  - ログイン後 '(nickname)さんの結果は...'
    - 順位表示
  - 'ログインして結果を残そう！'
  - もう一度　ボタン
  - ランキング　ボタン
  - ログイン　ボタン
  - トップ　ボタン

- ストップページ
  - トップへ　ボタン
  - 戻る　ボタン

- ランキングページ
  - 上位30位まで表示
  - 戻る　ボタン（結果ページへ）

- ログインページ
  - 入力フォーム
  - ログイン
  - '新規登録の方はこちら'

- 新規登録ページ
  - 入力フォーム
  - 登録　ボタン

##  ルール

- 問題と答えは完全一致

## 2. 主な機能一覧と技術選定

- [o] ランダムでコマンド問題を出題（例：`git commit -m "メッセージ"`）
Ruby on Rails
https://qiita.com/mailok1212/items/360d15eeab3bf9465f42

- [o] コマンドを入力 →　正解すると自動で次に進む
  javascript

- [o] ストップウォッチで計測
 JavaScript(setinterval)

- [ ] 結果表示(かかった時間)(ランキング)
  tailwind css

- [ ] ランキング表示（ログインユーザーのみ）
  Activerecord

- [ ] ゲストプレイ対応（スコア未保存）
  rails

- [o] ユーザー登録 / ログイン機能
  devise

---

## 3. 技術スタック（予定）

| 項目 | 技術 |
|------|------|
| フロントエンド | HTML/CSS + JavaScript（Stimulus予定） |
| バックエンド | Ruby on Rails |
| DB | MySQL |
| 認証 | Devise |
| UIライブラリ | Tailwind CSS（予定） |
| 開発環境 | Docker / docker-compose |
| デプロイ | 未定（Render or Railway候補） |


---

## 4. モデル構成（ラフ）

- User（id, email, nickname, encrypted_password, created_at, updated_at ）
- Game_session（id, user_id, duration, created_at, updated_at）
- Game_session_command(id, command_id, game_session_id)
- Command (id, body, description, created_at, updated_at)

---

## コントローラの構成


## 5. 検討中の仕様・課題

- ゲストプレイの保存方法（セッション or ローカルストレージ？）
- タイピング正確さの判定方法（完全一致 or レーベンシュタイン距離？）
- ランキングは全体 / カテゴリ別？
- 同じ問題の再出題ロジック

---

## 6. 今後の進行ステップ（予定）

1. 技術選定とPoC（Stimulusでタイピング検知できるか）
2. 最小機能で動くプロトタイプ作成（入力→保存→表示）
3. UI整備と機能追加
4. Devise認証 + ランキング導入
5. デプロイ・公開

---

## 7. 備考・その他メモ

- MVP（最小実用アプリ）に集中し、機能を絞る
- タイピング速度はms単位で記録（10回平均なども検討）

 docker compose run web rails generate migration AddDurationToScores duration:float
 docker compose run web rails generate controller Rankings index
 docker compose run web rails generate model Game_session value:integer user:references

# 必要な修正点
- [ ]セッション開始と同時にタイマーが始まる
- [ ]カーソルが自動でフォームに合う
- [ ]変換予測なし
- [ ]ログインとログアウトの表示箇所を限定する
- [ ]Figmaでレイアウト整える
- [ ]ゲストの結果は保存しない
- [ ]finishからresultに結果が飛んでない