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
| event_day | string     | null: false                    |
| title     | string     | null: false                    |
| content   | string     | null: false                    |
| grade_id  | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user