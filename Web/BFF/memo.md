# BFFについてのメモ

- [リバースプロキシ](https://www.kagoya.jp/howto/network/reverse-proxy/)と共に使用されることが多い
  - リバースプロキシとバックエンドAPIサーバーの中間に設定される

- Nuxtで使う場合
  - nuxtconfig.jsに記述すると簡単に利用できる

- フロント、BFF、APIという環境で運用する場合、クッキーの扱いが鬼門となる
  - BFF経由でリクエストヘッダからトークンが消えることがあるので、BFFで再度セットし直す

- サイレントログイン
  - ログイン永続化手法の一つ
  - Vuexのストアはブラウザを閉じるとなくなるが、set-cookieは残っている。set-cookieを持った状態でサイレントログイン用のAPIを叩く
  - nuxtのSSR時のnuxtServerInitのタイミングでサイレントログインして、Vuexに情報を保存する
