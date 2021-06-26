# アプリケーション名
Nikki

# アプリケーション概要
- 他のユーザーと記事の共有ができます。
- 他のユーザーの記事に対してコメントをすることができます。
- 日々の日記やメモを作成・公開ができます。

# URL
未実装

# テスト用アカウント
未実装

# 利用方法
- 新規登録にてアカウント作成後、ログインします。
- ヘッダーの「記事の作成」より新規記事投稿が可能です。
- 中心部の「Diary]タブの「新着一覧」は他ユーザー含めた新着、「投稿履歴」はログイン中のアカウントが過去にした投稿をそれぞれタイトル一覧表示しています。
- 記事詳細へはタイトルをクリックすることで遷移でき、ログイン状態であれば記事に対してのコメントをうつことができます。

# 洗い出した要件
[![Image from Gyazo](https://i.gyazo.com/265251a6bf3275517c64a1c2d8c7940b.png)](https://gyazo.com/265251a6bf3275517c64a1c2d8c7940b)

# 今後の実装予定
- 記事のソート機能
- プロフィール機能
- カレンダー機能
- カレンダーへのコメント機能
- 友達（フォロー）機能


# テーブル設計

## users テーブル

| Column                  | Type    | Options                  |
| ----------------------- | ------- | ------------------------ |
| nickname                | string  | null: false              |
| email                   | string  | null: false, unique:true |
| encrypted_password      | string  | null: false              |
| last_name               | string  | null: false              |
| first_name              | string  | null: false              |
| lname_kana              | string  | null: false              |
| fname_kana              | string  | null: false              |
| birthday                | date    | null: false              |

### Association

- has_many :articles
- has_many :comments

## article テーブル

| Column             | Type       | Options                           |
| ------------------ | -----------| --------------------------------- |
| title              | string     | null: false, limit:50             |
| content            | text       | null: false                       |
| user               | references | null: false, foreign_key:true     |

<!-- imageはActiveStorageにて実装予定 -->

### Association

- belongs_to :user
- has_many :comments

## comment テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| comment          | text         | null: false, limit:200         |
| user             | references   | null: false, foreign_key:true  |
| article          | references   | null: false, foreign_key:true  |

### Association

- belongs_to :user
- belongs_to :article

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, Scss, JavaScript, JQuery

## データベース
MySQL, SequelPro

## インフラ
AWS(EC2), Capistrano

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VsCode