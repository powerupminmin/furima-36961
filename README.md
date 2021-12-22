#　テーブル設計

# usersテーブル

| column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| born_day           | date   | null: false               |

## Association
- has_many :items
- has_many :item_buys

# itemsテーブル
| column                | Type       | Option                         |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| charge_id             | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| delivery_day_id       | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one    :item_buy

# buyersテーブル
| column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| post_code          | string     | null: false                     |
| area_id            | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| item_buy           | references | null: false, foreign_key: true  |

## Association
- belongs_to :item_buy

# item_buysテーブル
| column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :item
- has_one    :buyer
