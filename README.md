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

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| image        |            |                                |
| product_name | string     | null: false                    |
| text         | text       | null: false                    |
| category     | integer    | null: false                    |
| state        | integer    | null: false                    |
| burden       | integer    | null: false                    |
| prefecture   | integer    | null: false                    | 
| day          | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

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

| Column       | Type      | Option                         |
| ------------ | --------- | ------------------------------ |
| postal_code  | string    | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| address      | string    | null: false                    |
| building     | string    |                                |
| phone_number | string    | null: false                    |
| purchase     | reference | null: false, foreign_key: true |

### Association

belongs_to :purchase
