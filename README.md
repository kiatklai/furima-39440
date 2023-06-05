# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| introduction       | text   |             |
| birth_day          | date   | null: false |

### Association

- has_many :items dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :credit_card dependent: :destroy

## credit_cards テーブル

| Column      | Type      | Options                        |
| ----------  | ------    | ------------------------------ |
| user_id     | reference | null: false, foreign_key: true |
| customer_id | string    | null: false                    |
| card_id     | string    | null: false                    |

### Association

- belongs_to :user

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -----------------------------  |
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| description       | text       | null: false                    |
| item_condition_id | references | null: false, foreign_key: true |
| delivery_fee_id   | references | null: false, foreign_key: true |
| delivery_day_id   | references | null: false, foreign_key: true |
| area_id           | references | null: false, foreign_key: true |
| category_id       | references | null: false, foreign_key: true |
| brand_id          | references | null: false, foreign_key: true |
| user_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :area

## categories テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |

### Association

- has_many :items

## brands テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     |                                |

### Association

- has_many :items

## items_imgs テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | string     | null: false                    |
| items_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## item_conditions テーブル

| Column            | Type       | Options          |
| ----------------- | ---------- | -----------------|
| item_condition   | string     | null: false       |

### Association

- belongs_to :item

## delivery_fees テーブル

| Column        | Type            | Options           |
| ------------- | --------------- | ------------------|
| delivery_fee  | string          | null: false       |

### Association

- belongs_to :item

## delivery_days テーブル

| Column          | Type       | Options       |
| --------------- | ---------- | --------------|
| delivery_day    | string     | null: false   |

### Association

- belongs_to :item

## areas テーブル

| Column  | Type       | Options         |
| ------- | ---------- | ----------------|
| area    | string     | null: false     |

### Association

- belongs_to :item