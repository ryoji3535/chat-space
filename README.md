# rubyのバージョン  
2.3.0-dev  
# railsのバージョン  
5.0.0.1  
# データベース設計  
## messagesテーブル  
| body     | image    | user_id      | group_id     |
|----------|----------|--------------|--------------|
| text     | string   | integer      | integer      |
| 制約なし | 制約なし | 外部キー制約 | 外部キー制約 |
## usersテーブル  
| name     | mail     | password           |message_id|
|----------|----------|--------------------|----------|
| string   | string   | integer            |integer   |
| not null | not null |  not null, 一意制約 |一意制約   |
## groupsテーブル  
| name     |message_id|
|----------|----------|
| string   |integer   |
| not null | 外部キー制約 |
## users_groupsテーブル
| group_id     | user_id      |
|--------------|--------------|
| integer      | integer      |
| 外部キー制約   | 外部キー制約    |
