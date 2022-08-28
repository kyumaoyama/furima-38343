## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
has_many :items
has_many :buyer_managements



## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation　　　   | text   | null: false |
| situation_id       | integer| null: false |
| category_id        | integer| null: false |
| shipping_charge_id　| integer| null: false |
| prefecture_id      | integer| null: false |
| shipping_day_id   | integer| null: false |
| price              | integer| null: false |
| user　　            | references | null: false,foreign_key: true |

### Association
belongs_to :user
has_one :buyer_management




## ship_addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code    　　  | string  | null: false |
| prefecture_id   　| integer| null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| buyer_management　 | references | null: false,foreign_key: true |

### Association
belongs_to :buyer_management


#　buyer_managementsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user　　            | references | null: false,foreign_key: true |
| item     　        | references | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :ship_addresse
