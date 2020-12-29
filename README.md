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

# Tables

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| last_name_en          | string | null: false |
| first_name            | string | null: false |
| first_name_en         | string | null: false |
| birthday              | date   | null: false |


### Association
- has_one  :profile,       dependent: :destroy
- has_many :articles,      dependent: :destroy

## profilesテーブル
| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| degree                | string     |                   |
| affiliation           | string     |                   |
| research_fields       | string     |                   |
| contact               | string     |                   |
| education             | string     |                   |
| academic_affiliations | string     |                   |
| user                  | references | foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image, dependent: :destroy

## articlesテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| title            | string     | null: false                     |
| title_en         | string     |                                 |
| journal_name     | string     |                                 |
| publication_date | date       |                                 |
| abstract         | string     |                                 |
| category_id      | integer    | null: false, numericality: true |
| user             | references | null: false, foreign_key: true  |
### Association
- belongs_to :user
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category
- has_one_attached :article_file, dependent: :destroy

# ActiveHash
## category
include ActiveHash::Associations
- has_many :articles

# ActiveStorage
## image
## article_file