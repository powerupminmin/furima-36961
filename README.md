#　テーブル設計

# usersテーブル

| column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| born_day           | date   | null: false               |

## Association
- has_many :items

# itemsテーブル
| column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| charge             | string     | null: false                    |
| area               | string     | null: false                    |
| delivery_day       | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
- belongs_to :users
- has_one :buyers

# buyersテーブル
| column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| post_code          | string     | null: false                     |
| prefecture         | string     | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     | null: false                     |
| phone_number       | string     | null: false                     |
| user               | references | null: false, foreign_key: true  |

## Association
belongs_to :items

