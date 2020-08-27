# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| name                      | string | null: false |
| name_reading              | string | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| password_confrimation     | string | null: false |
| birthday                  | date   | null: false |


### Association
 has_many :items
 has_many :buyers


## items(商品) テーブル

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| image            | text      | null: false                   |
| name             | string    | null: false                   |
| explain          | string    | null: false                   |
| category         | string    | null: false                   |
| status           | string    | null: false                   |
| delivery_fee     | integer   | null: false                   |
| shopping_origin  | string    | null: false                   |
| delivery_date    | string    | null: false                   |
| price            | integer   | null: false                   |
| sold             | boolean   | null: false                   |
| user             |references | null: false, foreign_key: true|


### Association
 belongs_to :user
 has_one :item


## buyer(購入者) テーブル

| Column           | Type      | Options                       |
| ---------------- | ----------| ----------------------------- |
| card_num         | integer   | null: false                   |
| expiration       | integer   | null: false                   |
| security_code    | integer   | null: false                   |
| postal_code      | integer   | null: false                   |
| city             | string    | null: false                   |
| address          | string    | null: false                   |
| building         | string    | null: true                    |
| phone_number     | integer   | null: false                   |
| user             |references | null: false, foreign_key: true|
| item             |references | null: false, foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item

