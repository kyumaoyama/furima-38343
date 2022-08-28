## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false　|
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
has_many:products
has_one:buyer_managements
has_one:ship_addresses


## productsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation　　　   | text   | null: false |
| situation_id       | integer| null: false |
| category_id        | integer| null: false |
| shipping_charges_id| integer| null: false |
| shipping_area_id   | integer| null: false |
| shipping_days_id   | integer| null: false |
| price              | integer| null: false |
| user　　            | references | null: false,foreign_key: true |

### Association
belongs_to:users
belongs_to_active_hash :situation
belongs_to_active_hash :category
belongs_to_active_hash :shipping_charges 
belongs_to_active_hash :shipping_area
belongs_to_active_hash :shipping_days


## ship_addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| last_name_kana     | string | null: false |
| post_code    　　  | text   | null: false |
| prefectures_id   　| integer| null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone number       | string | null: false |
| buyer_management　 | references | null: false,foreign_key: true |

### Association
belongs_to:buyer_managements
belongs_to_active_hash :prefectures

#　buyer_managementsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user　　            | references | null: false,foreign_key: true |

### Association
has_many:users
has_many:products
has_many:ship_addresses
