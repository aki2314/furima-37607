# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| firstname          | string | null: false                   |
| familyname         | string | null: false                   |
| firstname_two      | string | null: false                   |
| familyname_two     | string | null: false                   |
| birthday           | date   | null: false                   |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type         | Options                        |
| ----------------- | ------------ | ------------------------------ |
| name              | string       | null: false                    |
| detail            | text         | null: false                    |
| category_id       | integer      | null: false                    |
| status_id         | integer      | null: false                    |
| shipmentsource_id | integer      | null: false                    |
| price             | integer      | null: false                    |
| derivalyprice_id  | integer      | null: false                    |
| derivalyday_id    | integer      | null: false                    |
| user              |references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## adresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| purchase            | references | null: false, foreign_key: true |
| post_number         | string     | null: false                    |
| shipmentsource_id   | integer    | null: false                    |
| si                  | string     | null: false                    |
| banti               | string     | null: false                    |
| building            | string     |                                |
| phone               | string     | null: false                    |


### Association

- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false  foreign_key: true |
| item    | references | null: false  foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress
