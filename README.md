## users

|Column            |Type  |Options    |
|------------------|------|-----------|
|nickname          |string|null: false|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|first_name        |string|null: false|
|last_name         |string|null: false|
|kana_first_name   |string|null: false|
|kana_last_name    |string|null: false|
|birthday          |date  |null: false|

### Association
has_many :items
has_many :orders

## items

|Column       |Type      |Options    |
|-------------|----------|-----------|
|name         |string    |null: false|
|description  |text      |null: false|
|category     |integer   |null: false|
|condition    |integer   |null: false|
|charge_type  |integer   |null: false|
|prefectures  |integer   |null: false|
|shipment_date|integer   |null: false|
|price        |integer   |null: false|
|user_id      |references|null: false, foreign_key: true|

### Association
has_one :order
has_many :users

## orders

|Column|Type        |Options                       |
|--------|----------|------------------------------|
|user_id |references|null: false, foreign_key: true|
|item_id |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :item
has_one :address

## addresses

|Column       |Type      |Options    | 
|-------------|----------|-----------|
|postal_code  |string    |null: false|
|prefectures  |integer   |null: false|
|city         |string    |null: false|
|address      |string    |null: false|
|building_name|string    |null: false|
|phone_num    |string    |null: false|
|order_id     |references|null: false, foreign_key: true|


### Association
belongs_to :order