# Webhookについてメモ

- コンシューマにイベントを通知するために使う
  - ポーリングは無駄が多い
  - イベント発生時、指定したURLにPOSTリクエストを送る

- 処理は単純かつ軽量であるべき

- __セキュリティには注意__
  - __APIのプロバイダだけが利用できるようにする__
    - IPアドレスのホワイトリスト
    - セキュリティトークン

## 参考
- [Webhookとは？](https://qiita.com/soarflat/items/ed970f6dc59b2ab76169)
