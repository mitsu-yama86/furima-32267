# テーブル設計

## usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| last_name             | string  | null: false |
| first_nam             | string  | null: false |
| last_name_kana        | string  | null: false |
| first_name_kana       | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    | 
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :purchase

## purchasesテーブル

| Column              | Type      | Option                         |
| ------------------- | --------- | ------------------------------ |
| user                | reference | null: false, foreign_key: true |
| item                | reference | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :delivery

## deliveriesテーブル

| Column          | Type      | Option                         |
| --------------- | --------- | ------------------------------ |
| postal_code     | string    | null: false                    |
| prefecture_id   | string    | null: false                    |
| city            | string    | null: false                    |
| address         | string    | null: false                    |
| building        | string    |                                |
| phone_number    | string    | null: false                    |
| purchase        | reference | null: false, foreign_key: true |

### Association

belongs_to :purchase
