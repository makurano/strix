# README

# アプリケーション名
## STRIX

# アプリケーション概要
STRIXは若い研究者と、研究者を目指す人々のためのwebアプリケーションです。
キャリアを形成する最中の研究者にとって必要なポートフォリオを**誰でも手軽に作ってほしい**という思いから生まれました。
研究論文、研究ノート、講義資料などを公開することができ、**研究者が自らマイページを作り上げ業績などを発信する**ことができます。
また、その研究者から指導を受ける学生にとっても大学などの機関のシステムに依存することなく講義資料を手に入れやすくしています。

# URL
https://strix.herokuapp.com/

# テスト用アカウント
画面右上の**ゲストログインボタン**を押してログインしてください。

# 利用方法
ユーザー登録をすると自分の記事の投稿、学術分野に関わるマイページの編集が可能になります。<br>
記事/研究者をフォームから検索することができます。<br>
記事のダウンロードボタンを押すと投稿されたファイルを手に入れることができます。<br>
**投稿や編集をする必要がない場合、ログインの必要はありません。**<br>

# 目指した課題解決
- 若い研究者が手軽に個人ページを持ち、発信できる環境を作りたい
- 講義資料を大学等のシステムに依存しなくても配布できるシステムを作りたい
- ユーザーにとって研究者を検索しやすく、その人についてすぐに調べることができるようにしたい

# 開発環境

- Ruby 2.6.5
- Rails 6.0.0
- HTML/CSS
- JavaScript
- MySQL
- AWS(S3)
- VS Code
- heroku
- GitHub
- Mac Catalina(10.15.6)

# 機能
##　・ユーザーログイン機能
Gem devise使用<br>
研究者はメールアドレス、パスワード、名前、英語名、生年月日を入力することでユーザー登録ができ、<br>
記事の操作やマイページを持つことができます。<br>

## ・記事投稿機能
Gem ActiveStorage使用<br>
ログイン中のユーザーはファイルを添付した記事を投稿することができます。

## ・記事一覧表示機能
全てのユーザーがタイトル、著者、掲載誌、掲載日、投稿日、カテゴリーをまとめた記事を一覧にして見ることができます。
[![Image from Gyazo](https://i.gyazo.com/090aa6c6abcc54640618477bb9ceab4e.png)](https://gyazo.com/090aa6c6abcc54640618477bb9ceab4e)

## ファイルダウンロード機能
全てのユーザーは記事に添付されたファイルを見ることができる。
[![Image from Gyazo](https://i.gyazo.com/a1104fda301b417a290b6632f8c7c3a0.gif)](https://gyazo.com/a1104fda301b417a290b6632f8c7c3a0)

## ・記事詳細表示機能
全てのユーザーが記事のタイトルをクリックすると記事の詳細ページを見ることができます。
[![Image from Gyazo](https://i.gyazo.com/5a46e7cf742fde947b6f0a93554d51f2.gif)](https://gyazo.com/5a46e7cf742fde947b6f0a93554d51f2)

## ・記事情報編集機能
ログイン中のユーザーは自分の投稿した記事の編集が可能です。

## ・記事情報削除機能
ログイン中のユーザーは自分の投稿した記事の削除が可能です。

## ・記事検索機能
全てのユーザーはフォームにキーワードを入力して関連する記事を検索できます。
[![Image from Gyazo](https://i.gyazo.com/ddfc1b45f580f44d5e79d8eaf577bc91.gif)](https://gyazo.com/ddfc1b45f580f44d5e79d8eaf577bc91)

## ・プロフィール表示機能
全てのユーザーは記事の著者名をクリックすると著者のプロフィールを閲覧できます。
[![Image from Gyazo](https://i.gyazo.com/3e6fdbede7624d39f33271e777423d9d.gif)](https://gyazo.com/3e6fdbede7624d39f33271e777423d9d)

## ・プロフィール編集機能
ログイン中のユーザーは自分のプロフィールを編集することができます。

## ・研究者検索機能
全てのユーザーはフォームに研究者名を入力して人物を検索できます。
[![Image from Gyazo](https://i.gyazo.com/82535012a05f2cca06c9762d82597b6c.gif)](https://gyazo.com/82535012a05f2cca06c9762d82597b6c)

## ・タブ切り替え機能
全てのユーザーはタブをクリックして記事を決められたカテゴリーごとに絞り込むことができます。
[![Image from Gyazo](https://i.gyazo.com/7af653a21176c587d67f8ff6d3d118e0.gif)](https://gyazo.com/7af653a21176c587d67f8ff6d3d118e0)

## ・ページネーション機能
Gem kaminari使用
全ての記事を1ページにつき10項目に分けて表示しています。

## ・マークダウン表示機能
Gem redcarpet使用
特定のフォームでマークダウン記法を使用することができます。
[![Image from Gyazo](https://i.gyazo.com/52dde44d1cdc46ab41dcb0821fa25a1c.gif)](https://gyazo.com/52dde44d1cdc46ab41dcb0821fa25a1c)

## ・画像プレビュー機能
JavaScript使用
プロフィール編集画面で現在選択している画像を表示させます。
[![Image from Gyazo](https://i.gyazo.com/8d75d6e24a131f6b8deca78e7e2dfd4f.gif)](https://gyazo.com/8d75d6e24a131f6b8deca78e7e2dfd4f)

## ・ゲストログイン機能
ポートフォリオ用としてユーザー登録無しで記事の投稿や編集のできるゲストユーザー機能を用意してあります。

# ER図
[![Image from Gyazo](https://i.gyazo.com/2ca7f0fac62e1358108dcd09bd1b53c9.png)](https://gyazo.com/2ca7f0fac62e1358108dcd09bd1b53c9)

# テーブル設計

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

## ActiveHash
### category
include ActiveHash::Associations
- has_many :articles

## ActiveStorage
- image
- article_file

# ローカルでの動作方法
$ git clone https://github.com/makurano/strix.git<br>
$ cd hoge<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
http://localhost:3000
