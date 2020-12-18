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
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| image        |            |                                |
| product_name | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| state        | string     | null: false                    |
| burden       | string     | null: false                    |
| prefecture   | string     | null: false                    |
| day          | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :purchase

## purchasesテーブル

| Column              | Type      | Option                         |
| ------------------- | --------- | ------------------------------ |
| card_info           | integer   | null: false                    |
| effectiveness_month | integer   | null: false                    |
| effectiveness_year  | integer   | null: false                    |
| security_code       | integer   | null: false                    |
| user                | reference | null: false, foreign_key: true |
| item                | reference | null: false, foreign_key: true |

### Association

belongs_to :user
has_many :items
has_one :delivery

## deliveriesテーブル

| Column       | Type      | Option                         |
| ------------ | --------- | ------------------------------ |
| postal_code  | integer   | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| address      | string    | null: false                    |
| building     | string    | null: false                    |
| phone_number | integer   | null: false                    |
| purchase     | reference | null: false, foreign_key: true |

### Association

belongs_to :purchase
