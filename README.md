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
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| nickname | string | null; false                    |
| email    | string | null; false                    |
| password | string | null; false                    |
| last_name  | string | null; false                  |
| first_name | string | null; false                  |
| last_kana_name | string | null; false              |
| first_kana_name | string | null; false             |
| birth | date | null; false                 |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string | null; false                    |
| description | text | null;false                    |
| category_id | integer | null; false |
| state_id | integer | null; false |
| pay_state_id | integer | null; false |
| ship_origin_prefecture_id | integer | null; false |
| ship_prepare_id | integer | null; false |
| price | integer | null; false                      |
| user_id | integer | null; false, foreign_key :true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| user | references | null; false, foreign_key :true |
| item | references | null; false, foreign_key :true |

### Association
- belongs_to :user
- belongs_to :item
- has_one: address

## addresses テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| postalcode | string | null; false                  |
| prefecture | integer | null; false |
| city     | string | null; false                    |
| street   | string | null; false                    |
| building | string |                                |
| phone_number | string | null; false               |
| purchase_id  | integer | null; false, foreign_key :true |

### Association
- belongs_to :purchase