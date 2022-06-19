# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| firstname          | string | null: false                   |
| familyname         | string | null: false                   |

### Association

- has_many :items
- has_many :adresses
- has_many :sells

## items テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| name           | string    | null: false                    |
| detail         | text      | null: false                    |
| category       | text      | null: false                    |
| status         | text      | null: false                    |
| shipmentsource | string    | null: false                    |
| price          | text      | null: false                    |
| derivaly_price | text      | null: false                    |
| derivaly_day   | text      | null: false                    |
| user           |references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :adresses
- has_many :sells

## adresses テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| source      | string       | null: false                    |
| buyuser     | string       | null: false                    |
| post_number | string       | null: false                    |
| ken         | string       | null: false                    |
| si          | string       | null: false                    |
| banti       | string       | null: false                    |
| phone       | string       | null: false                    |
| user        | references   | null: false, foreign_key: true |
| item        | references   | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_one :sells

## sells テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyuser | string     | null: false                    |
| product | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| adress  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :adresses
