#  なぜSSRを使うか？
- 昔はGoogleのクローラーがJSを理解できなかっため、一番の採用理由はssr対策だった
- 今はクローラーがJSを理解できるため、SEO対策としてSSRを採用するのは安易。ただクローラーも完全ではないため、やはり効果はある
- 一番大きな採用理由はFirst View Performance
## First View Performanceについて
- なぜSPAは遅いか
  - クライアントサイドへのJSのロードと実行を行う必要があるため
- なぜSSRは早いか
  - サーバー側でHTMLを生成して返すから
    - この処理はサーバーに高い負荷がかかってしまうのがデメリット
    - SSRを採用したプロダクトがスケールしたとき、負荷をどう処理するのかが難しい

## 参考
- [SSRとCSRの記事](https://www.publickey1.jp/blog/17/server_side_renderingserver_side_rendering_ng-japan_2017.html)
