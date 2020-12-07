## 参考記事

[OpenAPI (Swagger) 超入門](https://qiita.com/teinen_qiita/items/e440ca7b1b52ec918f1b)

[チームのWeb API開発を最適化するSchema Driven Developmentの解説＆実装例](https://qiita.com/Seiga/items/a59c800e57e022125e3b)

[OpenAPIを導入してみた話(sample project付属)](https://inside.bldt.jp/entry/2020/03/30/165218)

[スキーマファースト開発のためのOpenAPI（Swagger）設計規約](https://future-architect.github.io/articles/20200409/)

[本当に使ってよかったOpenAPI (Swagger) ツール](https://future-architect.github.io/articles/20191008/)

## 所感
- openAPIエコシステムの恩恵が受けられるのはかなり大きい
  - 若干の学習コストがかかるが、慣れてしまえばただのドキュメントで管理するよりかなり楽だし、[spotlight studio](https://stoplight.io/studio/)でyamlも書かなくて済む
- フロント、バックエンド間で認識の齟齬が起きにくくなるのに期待
  - API実装が終わり、フロントの実装をするタイミングで不具合や不整合が発覚して手戻り…みたいなパターンが多かった
- 既存のURI設計では厳しい部分があり、既存の設計の悪い部分に気づけた
