# rubyのバージョン  
2.3.0-dev  
# railsのバージョン  
5.0.0.1  
# データベース設計  
## messageテーブル  
| body | image  | user_id | group_id |
|------|--------|---------|----------|
| text | string | integer | integer  |
## userテーブル  
| user_name   | user_image |password| user_id | group_id |
|-------------|------------|--------|---------|----------|
| string      | string     |integer | integer | integer  |
## groupテーブル  
| group_name | user_id | group_id |
|------------|---------|----------|
| string     | integer | integer  |
