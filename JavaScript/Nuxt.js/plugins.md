# pluginsについてメモ
グローバルな処理を書く場合、以下の理由から基本的にplugins推奨。

- Nuxtの規約に則っている
- ssr, csrの設定が`nuxt.config.js`内や、拡張子をつけることで簡単に行える

[公式](https://ja.nuxtjs.org/guide/plugins/)を参考に、気になるところをまとめておく
## メモ

- Vueインスタンス生成前に処理が走るため、インスタンス生成前に行いたい処理を書く

> Nuxt.js では JavaScript プラグインを定義することができ、それはルートの Vue.js アプリケーションがインスタンス化される前に実行されます。この機能は、自前のライブラリや外部のモジュールを使用する際にとりわけ有用です。

- アプリ起動前にvee-validate, vue-notification, axiosのようなプラグインのセットアップ

> アプリケーション内で通知を表示する vue-notifications のような Vue プラグインを使用したい場合には、アプリケーションを起動する前にプラグインをセットアップする必要があります。

- 関数や値をグローバルに定義できる。以下に注入する形
  - Vueインスタンス
  - コンテキスト
  - Vuexストア
- 注入したものは$で参照できる

> 関数や値をアプリケーション全体で利用できるようにしたい場合もあるでしょう。そのような変数を Vue インスタンス（クライアントサイド）やコンテキスト（サーバーサイド）、さらに Vuex ストアへ注入することが可能です。それらの関数の前には $ を付けるのが一般的です。

## 所感
- グローバル汚れるのは気にした方がいいのかな
- 処理を共通化したい場合、他にもmiddleWare内に書く, utilsみたいなディレクトリ切ってインポートするみたいな手段があるけど、使い分けがわかってないので今後しらべる
