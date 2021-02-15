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

|Column          |Type      |Options    |
|----------------|----------|-----------|
|name            |string    |null: false|
|description     |text      |null: false|
|category_id     |integer   |null: false|
|condition_id    |integer   |null: false|
|charge_type_id  |integer   |null: false|
|prefecture_id   |integer   |null: false|
|shipment_date_id|integer   |null: false|
|price           |integer   |null: false|
|user            |references|null: false, foreign_key: true|

### Association
has_one :order
belongs_to :user

## orders

|Column|Type        |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key: true|
|item    |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses

|Column       |Type      |Options    | 
|-------------|----------|-----------|
|postal_code  |string    |null: false|
|prefecture_id|integer   |null: false|
|city         |string    |null: false|
|address      |string    |null: false|
|building_name|string    |           |
|phone_num    |string    |null: false|
|order        |references|null: false, foreign_key: true|


### Association
belongs_to :order