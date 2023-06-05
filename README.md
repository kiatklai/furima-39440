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
- has_many :buyers

## buyers テーブル

| Column      | Type       | Options                        |
| ----------  | ---------  | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -----------------------------  |
| post_code       | string     | null: false                    |
| area_id         | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| buyer           | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to_active_hash :area

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

- belongs_to :user
- has_one :buyer