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
- has_one :address
- has_many :purchases
- has_one :credits

## items テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string | null; false                    |
| description | text | null;false                    |
| category_id | references | null; false |
| state_id | references | null; false |
| pay_state_id | references | null; false |
| ship_origin_prefecture_id | references | null; false |
| ship_prepare_id | references | null; false |
| price | integer | null; false                      |
| fee   | integer |                                  |
| profit | integer |                                 |
| sales_user_id | integer | null; false, foreign_key :true |

### Association
- belongs_to :user
- has_one :item_image
- has_one :purchase

## addresses テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| postalcode | string | null; false                  |
| prefecture_id | integer | null; false, foreign_key :true |
| city     | string | null; false                    |
| street   | string | null; false                    |
| building | string |                                |
| phone_number | string | null; false               |
| user_id  | integer | null; false, foreign_key :true |

### Association
- belongs_to :user
- has_many :prefectures

## purchases テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| user_id | references | null; false, foreign_key :true |
| item_id | references | null; false , foreign_key :true|

### Association
- belongs_to :user
- belongs_to :item

##  item_images テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| item_id | references | null; false, foreign_key :true |
| image_url | text | null; false |

### Association
- belongs_to :item

##  item_categories テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string |                                |

### Association
- has_many :items


##  item_status テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string |                                |

### Association
- has_many :items

##  pay_status テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string |                                | 

### Association
- has_many :items

##  prefectures テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string |                                |

### Association
- has_many :items
- has_many :addresses

##  ship_prepares テーブル
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string |                                |
### Association
- has_many :items

### credits
| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| credit_card_approval_code | integer | null; false  |
| exp_month | integer | null; false                  |
| exp_year  | integer | null; false                  |
| secure_code | integer | null; false                |

### Association
- belongs_to_user