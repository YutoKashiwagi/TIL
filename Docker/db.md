# Docker使用時のDB周りのエラーや学んだことについてメモ

## PostgreSQL
### Rails + Docker + PostgreSQL環境
docker-compose.ymlのdbコンテナで環境変数`POSTGRES_PASSWORD`を指定しておかないとエラーになる。以前は指定しなくてもできたが、2020年1月以降のバージョンでは指定が必須になった模様。
- 参考
  - https://qiita.com/at-946/items/2fb75cec5355fad4050d
  - https://github.com/docker-library/docs/commit/2e59fc9a6aee9125eac1a29283205333da4760fa#diff-febe75211617514f6ecb81d53ec56250R133
