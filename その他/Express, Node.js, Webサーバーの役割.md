Express.jsがわからないのか、Node.jsがわからないのか、Webサーバーがわからないのか混乱することが多いので、調べた

## Webサーバー
[参考](https://qiita.com/shuntaro_tamura/items/ae55b99deb9e2a170754)

## Node.js

[参考](http://www.tohoho-web.com/ex/nodejs.html)

- サーバーサイドの JavaScript 実行環境。
- HTTP 通信のみでなく、TCP や UDP 通信も可能。
- [WebSocket](https://developer.mozilla.org/ja/docs/Web/API/WebSockets_API) サーバとして利用されることも多い。

## Express.js
[参考兼学習リソース](https://gist.github.com/mitsuruog/fc48397a8e80f051a145#express)

### メモ
- NuxtのseverMiddlewareではExpressのサーバーを起動する処理がないが、それはNuxtがやってるのかな？
  - [connect](https://github.com/senchalabs/connect)を使用しているらしい
    - [参考](https://ja.nuxtjs.org/api/configuration-servermiddleware/)
- serverMiddlewareとしてExpressを利用するとき、以下の要点に絞って考える
  - routing
  - middleware
  - [リンク](https://gist.github.com/mitsuruog/fc48397a8e80f051a145#express%E6%94%BB%E7%95%A5%E3%81%AE%E5%8B%98%E6%89%80)

