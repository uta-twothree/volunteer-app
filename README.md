## アプリケーション名

### VolunteerApp

## アプリケーション概要

### 登録したボランティアグループはアルバムを作成して活動内容を紹介・報告することができ、日々のボランティア活動をメモリーとして残すことができます。

## URL（本番環境）

### https://volunteer-app-35829.herokuapp.com/

#### テスト用アカウント（ログイン情報）

- Email : 
- Password :

## 目指した課題解決（制作背景）

### 私は「サッカークリニック」というボランティアグループに参加しています。活動内容としては、主に障がいを持つ小〜中学生に向けたサッカー教室のサポートを行っております。教室を卒業された生徒さんが高校進学、或いは社会に働きに出た際に、障がいを理由に様々な場面で苦労をするという話を以前から聞いており、卒業した彼らにも何かサポートができないかということが私たちの間で課題になっておりました。今回開発したアプリケーションの意図としては、卒業後の課題を我々が直接解決することは困難なものの、生徒さんたちが壁にぶつかった時、彼らの背中を支えてあげられるように楽しかったサッカー教室の思い出を振り返ることができることを目指しました。また、ボランティアグループ側も活動の内容を公開することで、他のグループと交流でき、それぞれが抱えている課題を共有・解決する機会を創出できます。

## 洗い出した要件

## DEMO（利用方法）

### トップページ（アルバム一覧画面）

#### [![Image from Gyazo](https://i.gyazo.com/d480d128b7134cffe700acb37a9af58d.jpg)](https://gyazo.com/d480d128b7134cffe700acb37a9af58d)
 

## 工夫したポイント

- ひとつの機能実装が完了する毎にはもちろん、ファイルの編集／変更毎にも挙動確認を行なったことです。より正確に、よりスムーズにアプリケーション開発を進めるにあたり、例えばひとつの機能の実装完了後にまったく別の箇所でエラーが発生していないか、或いは記述していたコードを変更したためにそれまで正常に動いていたはずが動かなくなってしまった等を、その都度確認する必要がありました。
- 「GitHub Desktop」を活用して、「commitの粒度」を細く刻むことで自分が作業している現在地を常に把握するように意識していました。
- ユーザー／アルバム／メモリーのそれぞれの詳細画面において、該当ページに遷移してきたユーザーがひと目で登録データ情報を確認できるようにするため、シンプルな表形式を用いて表示しました。
- ユーザー別にアクセスの制限を設けました。ボランティアに関わった方々がユーザー登録を行わなくとも、ボランティアグループが作成したアルバムに訪れ、投稿されているメモリーを自由に閲覧できて思い出を振り返ってもらえるようにしました。本棚に並んでいるアルバムを手に取り、そこに収められた写真を見返すことをイメージして実装しました。また、ユーザー／アルバム／メモリーの編集権限や削除権限は、ログイン済み且つユーザー本人しか行えないようにしています。
- 性別・年齢を問わず、誰にとっても見やすいフロント画面を担保するため、シンプルで視覚的にもやさしい色合いを用いてデザインしました。Adobeが提供している「Adobe Color」のカラーホイール機能を活用し、トップページに表示されている背景画像の色彩を基準にアプリケーション全体の色彩パターンを類似色で統一しました。

## 使用技術（開発環境）

### バックエンド

- Ruby, Ruby on Rails

### フロントエンド

- HTML, CSS, JavaScript

### データベース

- MySQL,Sequel Pro

### インフラ

- AWS(EC2), Capistrano

### Webサーバー（本番環境）

- nginx

### アプリケーションサーバー（本番環境）

- unicorn

### ソース管理

- GitHub, GitHub Desktop

### テスト

- Rspec

### エディタ

- Visual Studio Code


## データベース設計

### users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| group_name         | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| area_id            | integer | null: false               |
| theme_id           | integer | null: false               |
| group_introduction | text    |                           |

#### Association

- has_many :albums
- has_many :memories
- has_many :comments

### albums テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| name           | string     | null: false                    |
| content        | text       | null: false                    |
| area_id        | integer    | null: false                    |
| theme_id       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_many   :memories
- has_many   :comments

### memories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| date     | date       | null: false                    |
| user     | references | null: false, foreign_key: true |
| album    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :album

### comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| album    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :album
