# schoolcom	
# アプリケーション概要	
学校行事をカレンダーで共有することができる
# URL※	
https://schoolcom.onrender.com
# テスト用アカウント
basic認証ID:admin
basic認証パスワード:2222
教員:サンプル先生
メールアドレス:sample@sample.com
パスワード:sample111
保護者:サンプルママ
メールアドレス:mama@mama.com
パスワード:mama111

# 利用方法	
## 学校行事を投稿する
* ログインしてから利用可能とし、教員か保護者を選択する。教員の場合は教員コードを入力する。
* 教員のみ、クラスを作成、削除、イベントを投稿できる。
* 送信フォームに学校行事のタイトル、内容、日付、対象学年を入力する。
## 学校行事を閲覧する
* 保護者は投稿されたイベントを閲覧することができる。

# アプリケーションを作成した背景	
同級生である保護者にヒアリングし、学校からのお知らせの配布物が散乱していた。分析した結果、コロナの結果学校行事が変更になることや、そもそも紙ベースで連絡する習慣があった。また学校行事の細かな点の連絡がないことや、行事に対する保護者からの質問も共有されていないため、混乱が生じることがあった。そのため、学校行事について投稿しカレンダーで共有するアプリケーションの開発をすることとした。


# 洗い出した要件	
https://docs.google.com/spreadsheets/d/1DXXuyR6G4zimf6xtnjbohJ49aFcfbGk6Qb-Irps506Y/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明※	


# 実装予定の機能	
* お手伝い募集機能
* 管理者専用機能
* お問い合わせ機能

# データベース設計	
![](2023-05-27-10-48-56.png)

# 画面遷移図	
画面遷移図を添付。

# 開発環境	
フロントエンド
バックエンド
インフラ
テスト
テキストエディタ
タスク管理

# ローカルでの動作方法※	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。
# 工夫したポイント※	
制作背景:学校行事の細かいことを知らないことが多い。また例年どんな状況か分からないことがあった。そのため学校行事などのお知らせをする。その時のやりとりを公開するために作成した。
工夫した点:見やすさのためにカレンダー機能を導入した。


# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| position_id        | integer | null: false |
| position_code      | string  | null: false |


### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :events

## rooms テーブル

| Column   | Type       | Options                            |
| -------- | ---------- | ---------------------------------- |
| name     | string     | null: false                        |
| grade_id | integer    | null: false                        |


### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :events

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## events テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| event_day | date       | null: false                    |
| title     | string     | null: false                    |
| content   | text       | null: false                    |
| grade_id  | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

