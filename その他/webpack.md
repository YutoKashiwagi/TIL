# webpackについてメモ

- webpack-dev-server
  - コード編集時にビルドとブラウザのリロードをしてくれる
  - 再ビルドは高速
  - ソースマップを有効にすると、エラーが発生した際ビルド前のファイルを参照できる
- ローダー
  - css, 画像ファイルなどをjsモジュールに変換できる
  - jsモジュールに変換できれば、webpackでバンドルできる
  - webpackを学ぶことは、ローダーを学ぶことである
- 画像のバンドル
  - jsモジュール化すると
    - 元のサイズより大きくなる
    - 解析のためのオーバーヘッドがある
  - このため、iconのような小さいサイズでいろんな種類があるファイルはバンドルに向いている
  - url-loader
- htmlのバンドル
  - html-loader
- Babel
  - Babel自体はJSのトランスパイラーなので、バンドル機能は供えてない
    - webpackと一緒に使う
