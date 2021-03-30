## MDNを読んでのメモ
### cookieって何？
- サーバーからブラウザに送信する
  - ブラウザからもリクエストに含めてサーバーに送信できる
- 一般的には、二つのリクエストが同じサーバーから送信されたものかどうかを判別するためのもの
- ステートレスなHTTPプロトコルに情報を持たせるために使う
- 用途
  - セッション管理
  - パーソナライゼーション
  - トラッキング
    - ここよくわかってない
- 汎用的な記憶領域として使える？
  - 小さなデータしか持てない
  - 記憶はcookieではなくWeb Strageとかを使うべき

- sessionクッキー
  - 期限を指定していないクッキー。ブラウザを閉じると削除される
- 永続的クッキー
  - 期限を指定したクッキーはその期間中、ブラウザを閉じても削除されない
  - Expires, Max-Ageなどで指定。両方指定するとMax-Ageが優先される

- サードパーティクッキー
  - 他のドメイン由来のCookie。主にウェブ上での広告やトラッキングに使用される
  - ホストのドメイン由来のクッキーはファーストパーティクッキー

### [Set-Cookieヘッダー](https://developer.mozilla.org/ja/docs/Web/HTTP/Headers/Set-Cookie)

- サーバーからユーザーエージェントにCookieを送信するために使用される。
- > 一般的なWebブラウザはHTTP Requestを発行する際にそのResponse Headerに Set-Cookieが含まれていれば自動でローカルのCookie Storageに値をドメイン情報と合わせて保管してくれます
  - [参考](https://blog.andoshin11.me/posts/cookie-forwarding-on-ssr)

### [Cookieヘッダー](https://developer.mozilla.org/ja/docs/Web/HTTP/Headers/Cookie)
- ユーザーエージェントからサーバーにCookieを送信するために使う
