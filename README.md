# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# cafelog

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Cafelog

# DB設計
***
## ER Diagram
<img width="1294" alt="cafelog-diagram" src="https://user-images.githubusercontent.com/65844442/105655409-57f2c280-5f03-11eb-92b8-bd86ba464857.png">


***

## Usersテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|nickname|STRING|null: false|
|email|STRING|null: false, unique: true|
|password|STRING|null: false|
### Association
- has_many :comments, dependent:destroy
- has_many :favorited_shops, through: :favorites, souce: :shop

***

## Shop_ownersテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|STRING|null: false|
|email|STRING|null: false, unique: true|
|password|STRING|null: false|
### Association
- has_many :shops

***

## Shopsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|STRING|null: false|
|address_id|references|null: false, foreign_key: true|
|shop_owner_id|references|null: false, foreign_key: true||
### Association
- has_one :address, dependent:destroy
- has_many :comments, dependent:destroy
- has_many :favorites, dependent:destroy
- has_many :tags, through: :shop_tags
- has_many :images, dependent:destroy
- belongs_to :shop_owner

***

## Addressesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|postal_code|STRING|null: false|
|prefecture|STRING|null: fasle|
|city|STRING|null: fasle|
|house_number|STRING|null: fasle|
|building_name|STRING|null: fasle|
|phone_number|STRING|null: fasle|
### Association
- has_one :shop, dependent:destroy

***

## Imagesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|url|STRING|null: false|
|shop_id|references|null: false, foreign_key: true|
### Association
- belongs_to :shop, dependent:destroy

***

## Commentテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|text|TEXT|null: false|
|user_id|references|null: false, foreign_key: true|
|shop_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user, dependent:destroy
- belongs_to :shop, dependent:destroy

***

## Favoritesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|user_id|references|null: false, foreign_key: true|
|shop_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user, dependent:destroy
- belongs_to :shop, dependent:destroy

***

