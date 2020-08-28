
# テーブル設計

## users テーブル

| Column                           | Type   | Options     |
| -------------------------------- | ------ | ----------- |
| nickname                         | string | null: false |
| family_name                      | string | null: false |
| first_name                       | string | null: false |
| family_name_reading              | string | null: false |
| first_name_reading               | string | null: false |
| email                            | string | null: false |
| password                         | string | null: false |
| password_confirmation            | string | null: false |
| birthday                         | date   | null: false |

### Association
- has_many :items
- has_many :buys

## items(商品) テーブル

| Column              | Type      | Options                       |
| ------------------- | --------- | ----------------------------- |
| image               | text      | null: false                   |
| name                | string    | null: false                   |
| explain             | text      | null: false                   |
| category_id         | integer   | null: false                   |
| status_id           | integer   | null: false                   |
| delivery_fee_id     | integer   | null: false                   |
| shopping_origin_id  | integer   | null: false                   |
| delivery_date_id    | integer   | null: false                   |
| price               | integer   | null: false                   |
| user                |references | null: false, foreign_key: true|


### Association
- belongs_to :user　
- has_one :buy

## buys(購入管理) テーブル

| Column      | Type          | Options                        |
| ----------- | --------------| ------------------------------ |
| user        | references    |  null: false, foreign_key: true|
| item        | references    |  null: false, foreign_key: true|


### Association

 - belongs_to :user
 - belongs_to :item
 - has_one :address



## addresses(住所) テーブル


| Column            | Type      | Options                       |
| ----------------- | ----------| ----------------------------- |
| postal_code       | integer   | null: false                   |
| prefectures       | integer   | null: false
| city              | string    | null: false                   |
| address           | string    | null: false                   |
| phone_number      | string    | null: false                   |
| buy               |references | null: false, foreign_key: true|


### Association

- belongs_to :buy


