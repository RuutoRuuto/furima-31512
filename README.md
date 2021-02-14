## users

|Column         |Type  |Options    |
|---------------|------|-----------|
|nickname       |string|null: false|
|email          |string|null: false, unique: true|
|password       |string|null: false|
|first_name     |string|null: false|
|last_name      |string|null: false|
|kana_first_name|string|null: false|
|kana_last_name |string|null: false|
|birthday       |date  |null: false|

### Association
has_many :items
has_many :orders

## items

|Column       |Type      |Options    |
|-------------|----------|-----------|
|name         |string    |null: false|
|description  |text      |null: false|
|category     |string    |null: false|
|condition    |text      |null: false|
|charge_type  |string    |null: false|
|prefectures  |string    |null: false|
|shipment_date|date      |null: false|
|price        |int       |null: false|
|seller       |references|null: false, foreign_key: true|

### Association
belongs_to :orders

## orders

|Column|Type      |Options                       |
|------|----------|------------------------------|
|buyer |references|null: false, foreign_key: true|

### Association
belongs_to :users
has_one :items
has_many :addresses

## addresses

|Column     |Type  |Options    | 
|-----------|------|-----------|
|postal_code|int   |null: false|
|prefectures|string|null: false|
|city       |string|null: false|
|address    |string|null: false|
|phone_num  |int   |null: false|

### Association
belongs_to :orders