# README
<img width="369" alt="スクリーンショット 2021-09-25 23 27 30" src="https://user-images.githubusercontent.com/83779040/134775071-6b6f692d-6cb2-4d06-99a1-38efc782f9b1.png">

URL： [https://limitless-beyond-47766.herokuapp.com](https://limitless-beyond-47766.herokuapp.com)

## コンセプト
旅人による離島を知りたい人のためのSNS

## 開発環境
- 言語：Ruby 2.6.5, JavaScript, HTML, CSS, SQL
- フレームワーク：Ruby on Rails 5.2.5, Bootstrap3
- JavaScriptライブラリ：jQuery
- データベース：PostgreSQL
- クラウドプラットフォーム：Heroku

## 主な使用Gem
- アカウント登録・ログイン機能
    - gem 'devise'
    - gem 'devise-i18n'  
- 管理者機能
    - gem 'rails_admin'
    - gem 'cancancan'
- 画像アップロード（ActiveStorage）
    - gem 'mini_magick'
    - gem 'image_processing'
    - gem 'google-cloud-storage'
- 検索機能
    - gem 'ransack'

## その他技術
- Ajax（検索機能, コメント機能, お気に入り機能）
- OpenWeatherMap（天気予報機能）
[天気予報機能について](weathers/README.md)

## 実行手順
```
$ git clone git@github.com:Kosuke-Nagamatsu/ritomania.git
$ cd ritomania
$ bundle install
$ rails db:create && rails db:migrate
$ yarn add jquery
$ rails s
```

## カタログ設計
[https://docs.google.com/spreadsheets/d/1KjIt5SRG7Pc09_L2WjtKccqr76J5wg2vVztcCagMjCU/edit?usp=sharing](https://docs.google.com/spreadsheets/d/1KjIt5SRG7Pc09_L2WjtKccqr76J5wg2vVztcCagMjCU/edit?usp=sharing)

## テーブル定義書
[https://docs.google.com/spreadsheets/d/1lVT28c6k48KXQFzg2dsFPC6VZNckL3ADDxXYHxK1kBY/edit?usp=sharing](https://docs.google.com/spreadsheets/d/1lVT28c6k48KXQFzg2dsFPC6VZNckL3ADDxXYHxK1kBY/edit?usp=sharing)

## ワイヤーフレーム
[https://cacoo.com/diagrams/tstdj2YyHCJipygP/25B29](https://cacoo.com/diagrams/tstdj2YyHCJipygP/25B29)

## ER図
<img width="832" alt="スクリーンショット 2021-09-25 21 17 02" src="https://user-images.githubusercontent.com/83779040/134773172-f5b99fc2-47fc-43ed-8ca8-ee650a450990.png">

## 画面遷移図
<img width="1203" alt="スクリーンショット 2022-01-18 10 44 09" src="https://user-images.githubusercontent.com/83779040/149856447-5a683a63-dcf8-47d4-93e5-37c62d99cc6f.png">
