# テーブル設計

## usersテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false |
| password            | string    | null: false |
| first_name          | string    | null: false |
| last_name           | string    | null: false |
| first_name_katakana | string    | null: false |
| last_name_katakana  | string    | null: false |
| year                | integer   | null: false |
| month               | integer   | null: false |
| day                 | integer   | null: false |

### Association

- has_many :items
- has_many :logs

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| delivery_burden  | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| days_to_delivery | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :log

## logsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :customer

## customersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| log           | references | null: false, foreign_key: true |

### Association

- belongs_to :log
- has_many :cards

## cardsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| month         | integer    | null: false                    |
| year          | integer    | null: false                    |
| security_code | integer    | null: false                    |
| customer      | references | null: false, foreign_key: true |

### Association

- belongs_to :customer