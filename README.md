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

# データベース設計


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
