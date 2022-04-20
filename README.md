# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| team_name          | string | null: false |
| number             | string | null: false |


### Association

- has_many :meetings
- has_many :comments

## meetings テーブル

|   Column    |    Type    |      Options        |
|   ------    |   ------   |    -----------      |
|   content   |    text    |     null: false     |
|   attack    | 　 text　   |     null: false     |
|   defence   |    text    |     null: false     |
|  attack_url |    text    |     null: false     |
| defence_url |    text    |     null: false     |
|    user     | references |     null: false     |

### Association

- belongs_to :users
- has_many :comments


## comments テーブル

| Column    |   Type       | Options                          |
| ------    | ----------   | ------------------------------   |
| content   | text         | null: false                      |
| meeting   | references   | null: false, foreign_key: true   |
| user      | references   | null: false, foreign_key: true   |

### Association

- belongs_to :users
- belongs_to :meetings
