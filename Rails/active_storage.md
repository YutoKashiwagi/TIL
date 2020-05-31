# active_storageを使ってみてのメモ
https://railsguides.jp/active_storage_overview.html

- 画像用のカラムを作る必要がない(ポリモーフィックで紐付けられる)
- carrierwaveとの比較: https://www.fundely.co.jp/blog/tech/2019/12/11/180024/

## 導入方法
- `rails g active_storage:install`コマンドでテーブルが二つ作成される

### 各テーブルについて

#### active_storage_attachments
- 紐づけるための情報を保存するテーブル
- polymorphic使用

#### active_storage_blobs
- 画像自体の情報を保存するためのカラム
