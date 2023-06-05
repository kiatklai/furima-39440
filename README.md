# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many :items
- belongs_to :destination
- belongs_to :buyer

## buyers テーブル

| Column      | Type      | Options                        |
| ----------  | ------    | ------------------------------ |
| user        | reference | null: false, foreign_key: true |
| item        | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -----------------------------  |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :user

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| description       | text       | null: false                    |
| item_condition_id | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| delivery_day_id   | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :buyer
- has_many :images dependent: :destroy
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :area
