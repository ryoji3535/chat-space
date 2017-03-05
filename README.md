# rubyのバージョン  
2.3.0-dev  
# railsのバージョン  
5.0.0.1  
# データベース設計  
## messagesテーブル  
| body     | image    | user_id | group_id|
|----------|----------|---------|-------|
| text     | string   |inetger  |integer |
| 制約なし | 制約なし |外部キー制約 | 外部キー制約|
## usersテーブル  
| name     | mail     | password           |
|----------|----------|--------------------|
| string   | string   | integer            |
| not null | not null,一意制約 |  not null, 一意制約 |
## groupsテーブル  
| name     |
|----------|
| string   |
| not null |
## users_groupsテーブル  
| group_id     | user_id      |
|--------------|--------------|
| integer      | integer      |
| 外部キー制約   | 外部キー制約    |

#モデル間の関係  
1.Userモデル  
  *has_many: messages  
  *has_many: groups, through:users_groups  
2.Groupモデル  
  *has_many: messages  
  *has_many: users, through:users_groups  
3.Messageモデル  
  *belongs_to: user  
  *belongs_to: group  
4.UserGroupモデル  
  *belongs_to:user  
  *belongs_to:group  
