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
| birthday           | string | null: false                   |

### Association

- has_many :items
- has_many :sells

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
- has_one :sells

## adresses テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| source      | string       | null: false                    |
| buyuser     | string       | null: false                    |
| post_number | string       | null: false                    |
| ken         | integer      | null: false                    |
| si          | string       | null: false                    |
| banti       | string       | null: false                    |
| building    | string       | null: false                    |
| phone       | string       | null: false                    |
| user        | references   | null: false, foreign_key: true |
| item        | references   | null: false, foreign_key: true |


### Association

- belongs_to :sell

## sells テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyuser | references | null: false  foreign_key: true |
| product | string     | null: false                    |
| adress  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- hass_one :adresses
