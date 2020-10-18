##  [XMLHttpRequest](https://developer.mozilla.org/ja/docs/Web/API/XMLHttpRequest)

- ページ遷移なしでサーバーと情報のやりとりをするためのリクエスト
- axiosで使われている

> XMLHttpRequest (XHR) オブジェクトは、サーバーと対話するために使用されます。ページ全体を更新する必要なしに、データを受け取ることができます。これでユーザーの作業を中断させることなく、ウェブページの一部を更新することができます。 XMLHttpRequest は AJAX プログラミングで頻繁に使用されます。

## [Ajax](https://developer.mozilla.org/ja/docs/Glossary/AJAX)

- XMLHttpRequestを使ってwebページを作るための手法
- DOMを一部分更新
- Fetch APIに置き換えられつつある

## [Fetch API](https://developer.mozilla.org/ja/docs/Web/API/Fetch_API)

- XHRからFetch APIへの移行が進められている
- axiosからkyへの移行も進められている
  - Nuxtもkyをサポートしている

> Fetch API には (ネットワーク越しの通信を含む) リソース取得のためのインターフェイスが定義されています。XMLHttpRequest と似たものではありますが、より強力で柔軟な操作が可能です。


## 所感

AjaxとXHRって何が違うんだろう？
↓
XHRを実現するための手段がAjaxだったのか！
↓
XHRからFetch APIへの移行が進められてるのか

という流れで完全に理解した

- Nuxtでkyがサポートされてるけど、もうちょっと枯れるのを待つか
- kyはリトライとタイムアウトがあるのが良い
- Fetch APIはIEが対応してない
