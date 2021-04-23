# SSGL (Small step is a Giant leap)

# 概要

プログラミング初学者、またプログラミング初学者をフォローするメンターをターゲットにした学習支援サービスです。  
チームリーダーになり、複数名にメンターの役割を持たせることができます。  
リーダー、またメンターは適切なタスクをメンバーに与え、メンバーはタスクに挑戦することができます。

メンバーはタスクをクリアしたらその時のモチベーションを合わせてリーダーに提出することができます。  
また、難易度が難しい、期限内に達成できなかった場合はどこが難しかったのかリーダーに報告することができます。

リーダーは達成率やタスクに対してのモチベーションを見ることで、初学者がどのタスクが難しいかを  
把握することができるため、対象のタスクの改善に役立てることができます。

定期的にタスクをアップデートすることにより、より挫折させずに楽しくステップアップすることができます。

# コンセプト

プログラミング初学者が学習する上で Progate やドットインストールといった初学者向けの  
学習サービスが整っている中、同じ内容を何度も周回する、ローカル環境でのバージョン差異に  
より想定した挙動にならないなど、未だ挫折するユーザーが多く感じていました。

挫折してしまう要因として下記点に問題があると考えました。

1. 初学者向けの学習サービスを終え、次のステップアップへと進む際、環境構築、バージョン差異等  
   アプリ開発以外での技術に対するギャップが存在する。
2. 個人によって学習する環境、学習時間が異なるため、モチベーション管理が難しい。
3. 同じ初学者といえど経験した環境によって習得度に差がある。

この問題を解決するためには、メンターが個人にあったレベルの学習を行う、またモチベーションを管理する必要が
あります。

しかし、事実として個人の学習進捗にはばらつきが非常に多く、管理するコストはとても大きいものと考えています。

本アプリケーションは、リーダー、またメンターが個人に適したタスクを提供し、そのタスクの理解度、モチベーションを確認し、  
タスクをアップデートしていくことで、メンターの管理コストを下げつつかつ、メンバーは自分に適したタスク解くことで、  
無理なく楽しくプログラミング学習を行うことができます。

# 開発背景

https://github.com/yodev21/ssgl/files/4855555/default.pdf

# 使用方法

チームリーダー（管理者）

1. 新規でチームを作成します。
2. 作成したチームにひもづくタスクを作成します。
3. メンバーに参加していただきタスクを実施していただきます。
4. メンバーがタスク提出をした場合確認し、レビューを行います。
5. タスク完了後のフィードバック内容を確認し、レベルに合わせたタスクを新しく作成します。

メンター

1. 所属しているチームにて新しくタスクを作成します。
2. メンバーに参加していただきタスクを実施していただきます。
3. メンバーがタスク提出をした場合確認し、レビューを行います。
4. タスク完了後のフィードバック内容を確認し、レベルに合わせたタスクを新しく作成します。

メンバー

1. 任意のチームに参加します。
2. 参加したチームの任意のタスクに取り組みます。
3. タスクが完了した場合、提出します。
4. 提出後そのタスクに対してフィードバックを行います。
5. 管理者または、メンターがレビューを行うため、修正箇所がある場合再度提出します。

# バージョン情報

- Ruby: 3.0.1
- Ruby on Rails: 6.1.3.1
- PostgreSQL: 12.2
- Docker: 19.03.8
- docker-compose: 1.25.4

# 使用技術

- Ruby
- Ruby on Rails
- Docker
- Docker Compose
- Nginx
- unicorn
- AWS
  - EC2
  - S3
  - VPC
  - Route53
  - RDS
  - ERB

# [構成図](https://docs.google.com/spreadsheets/d/1gwdg1GKj0wkPb06tlWZLU2vbZhuRLNEkIUAo5bPcqzs/edit#gid=0)

![infrastructure_diagram](https://user-images.githubusercontent.com/60313195/85969602-1c425980-ba03-11ea-83e2-61dfe19c3205.png)

# 機能一覧

- ユーザー機能

  - サインイン機能
  - サインアップ機能
  - ユーザー情報詳細表示機能
  - ユーザー情報更新機能
  - ゲストログイン機能

- チーム機能

  - チーム作成機能
  - チーム一覧表示機能
  - チーム情報詳細表示機能
  - チーム情報更新機能
  - チーム削除機能
  - チーム検索機能

- メンター機能

  - メンター昇格機能
  - メンター降格機能

- タスク機能

  - タスク作成機能
  - タスク一覧表示機能
  - タスク詳細情報表示機能
  - タスク情報更新機能

- タスク回答機能

  - タスク回答作成機能
  - タスク回答更新機能

- コメント機能
  - コメント作成機能
  - コメント削除機能
- タスク添削機能

  - コメントをすることで差し戻し状態にする機能（リーダー or メンター）
  - コメントをすることでレビュー待ち状態にする機能（メンバー）
  - タスク完了機能

- フィードバック機能
  - フィードバック一覧表示機能
  - フィードバック情報詳細表示機能

# [カタログ設計](https://docs.google.com/spreadsheets/d/1oHgA2ZhySNAlNgKrrgEYxRSaP3c4eL6gM-v7B7IWB30/edit#gid=0)

https://docs.google.com/spreadsheets/d/1oHgA2ZhySNAlNgKrrgEYxRSaP3c4eL6gM-v7B7IWB30/edit#gid=0

# [テーブル定義](https://docs.google.com/spreadsheets/d/1cxlPA0EkPQ5XHwOdjX4sfhwo3OuKy7qi73rnjT1iKkM/edit#gid=0)

https://docs.google.com/spreadsheets/d/1cxlPA0EkPQ5XHwOdjX4sfhwo3OuKy7qi73rnjT1iKkM/edit#gid=0

# [ER 図](https://drive.google.com/file/d/11EMA0RwJOyFmsjU04OJLQzTj_PpRZrF7/view?usp=sharing)

https://drive.google.com/file/d/11EMA0RwJOyFmsjU04OJLQzTj_PpRZrF7/view?usp=sharing

# [画面遷移図](https://drive.google.com/file/d/1GFX3bJS14JejGA8Xl1LPCGNLd505Y3kE/view?usp=sharing)

https://drive.google.com/file/d/1GFX3bJS14JejGA8Xl1LPCGNLd505Y3kE/view?usp=sharing

# [ワイヤーフレーム](https://drive.google.com/file/d/14jobJ0jIBX10wl9AzeKD5eLBJjNwAoom/view?usp=sharing)

https://drive.google.com/file/d/14jobJ0jIBX10wl9AzeKD5eLBJjNwAoom/view?usp=sharing
