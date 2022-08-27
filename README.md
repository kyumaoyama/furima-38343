## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false, unique: true |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
has_many:products
has_one:buyers
has_one:ship_ad


## Productsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation　　　   | text   | null: false |
| situation          | string | null: false, unique: true |
| shipping_charges   | integer| null: false |
| shipping_area      | string | null: false |
| shipping_days      | integer| null: false |
| price              | integer| null: false |
| user_id            | references | null: false,foreign_key: true |

### Association
belongs_to:users


## ship_addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| last_name_kana     | string | null: false |
| post_code    　　  | text   | null: false |
| prefectures   　   | text   | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone number       | string | null: false |
| user_id            | references | null: false,foreign_key: true |

### Association
belongs_to:users


#　buyersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | references | null: false,foreign_key: true |

### Association
belongs_to:users
