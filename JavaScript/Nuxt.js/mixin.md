# 共通化したい処理がある場合どうするか
例: ログインしているかの確認用メソッドなど

- mixinに書いて、各コンポーネントでインポートする
  - [参考](https://nuxt.alizlab.com/%e3%80%90nuxt-js%e3%80%91nuxt%e6%96%87%e6%b3%95%e7%b7%a8%ef%bc%9amixin/)
- Vueインスタンスに注入する
  - [参考](https://ja.nuxtjs.org/guide/plugins/#%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%88%E3%82%84-context-%E3%81%AB%E6%B3%A8%E5%85%A5%E3%81%99%E3%82%8B)
- pluginsに書いて、各コンポーネントで呼び出す
