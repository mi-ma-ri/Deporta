# アプリケーション名
Deporta

# アプリケーション概要
スポーツにおける戦術やチームの規律を共有できる
※今後戦績管理やスケジュール管理も実装予定

# URL
http://18.178.74.224/

#　テスト用アカウント
*Basic認証パスワード:2939
*Basic認証ID:admin
*メールアドレス:michihiros93@gmailcom
*パスワード:shi034936

# 利用方法
## ミーティング事項
1.URLをクリックすると新規登録ページに遷移する
2.トップページよりmeetingをプッシュし、共有事項と戦術面の投稿をする
3.内容を確認したらコメントで反応をする

# チームの成熟度を上げる
1.チームとしてどんなプレーを心がけるかの方向性を確立する
2.動画共有をすることで、視覚的にイメージ付けをしやすい

# アプリケーションを作成した背景
社会人サッカーチームの代表を経験し、「どんな意図を持って活動するか」の重要性を大きく感じました。
社会人は仕事が優先となり、週末の娯楽としてあるのがアマチュアスポーツの意義だと考えております。
しかし、チームの基盤や規律がないと活動意義を見失ってしまうことに気づきました。
そこで、次のアクションを確認できることでチームの方向性が見えるのではないかと感じアプリケーションの開発を考えました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1DG0krTDG_qBd37jlk_735tJDQkwqOtL_a0Rymp83a0g/edit#gid=982722306

# 実装予定の機能
過去のチーム戦績、チームスケジュール確認機能を実装予定
現在、登録すると各チームの情報が見えてしまうため代表者が管理者でチームメンバーを招待する機能も実装予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/57961792d546743e8b86ae84a9b9b859.png)](https://gyazo.com/57961792d546743e8b86ae84a9b9b859)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/272327abf086be30fda18b81bce4c303.png)](https://gyazo.com/272327abf086be30fda18b81bce4c303)

開発環境
・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク編集

# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://github.com/mi-ma-ri

# 工夫したポイント
投稿一覧ページは、javascriptを用いて実装。
投稿者の投稿日時を表示。(認識相違のトラブルを防ぐため。実体験を踏まえて実装。)
併せてコメント機能にも日時を表示。(連絡漏れのエビデンスを残しチームの規律を高める狙い)
コメント編集機能はコメントを編集し回答をすることを防ぐため実装しておりません。


