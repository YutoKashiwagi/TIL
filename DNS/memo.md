## [DNSがよくわかる教科書](https://www.amazon.co.jp/dp/B07KQSRZ1S/)

- アドレッシング
  - リソースにアクセスするため、識別子一意に定める
- ネーミング
  - エイリアスをつけてわかりやすくする

- DNSの階層化と委任
  - かつてはIPアドレスと名前の対応づけを一つのレジストリ（SRI-NIC）が管理していた
    - 申請の数が増えてきて、一つのレジストリが管理するのが難しくなった
      - 階層化と委任の考え方が生まれた

- レジストリ
  - レジストリオペレーター
    - 識別子の割り当て、管理業務をおこなう
  - レジストリデータベース
    - レジストリオペレーターが使うDB

- レジストリ・レジストラモデル
  - ドメインを登録したい人とレジストリの仲介をレジストラが担う

- 委任情報
  - ドメインの階層構造を辿れるように、親と子が持つべき委任関係の情報

- ゾーン
  - 委任によって任された管理の範囲

- DNSの名前解決の仕組み
  - ルート→委任先1→委任先2(委任先1からの委任情報)
    - 委任関係を辿ってIPアドレスを見つける
    - ネームサーバーはキャッシュを使って負担軽減をする

- DNSの構成要素
  - スタブリゾルバー
    - 末端のクライアント
      - スタブ（末端）
      - ブラウザやクライアントの端末に内蔵されている
    - フルリゾルバーへ問い合わせ(名前解決要求)を送る
      - ドメイン名とタイプ(A, AAAAなど)を送る
  - フルリゾルバー
    - 名前解決要求を受け、キャッシュ内で解決できるか試みる。キャッシュになければ権威サーバーへ問い合わせる
    - 名前解決の結果をキャッシュする
  - 権威サーバー
    - ドメイン名に対応するIPアドレスを返す
    - いわゆるネームサーバー
    - リソースレコードを保有
  - スタブリゾルバー、フルリゾルバー、権威サーバーの概念はいくつか表記揺れがあるので注意

- リソースレコード
  - [参考](https://jprs.jp/glossary/index.php?ID=0165)
  - TXTレコード
    - 自由なテキストを記述できる
      - 特定の記述方法に従ったテキストを配置し、SPFなどのドメイン名に紐づいた他の技術の設定に利用できる

- 権威サーバー
  - 冗長構成が基本
    - プライマリーサーバー、セカンダリーサーバー
      - プライマリーサーバー→ゾーン転送→セカンダリーサーバー
        - ゾーン転送は差分送信が基本
    - フルリゾルバーはRTT(Round Trip Time)が短いサーバーを優先して問い合わせる

- digコマンド: DNSの動作状況を確認できる
  - オプションで再帰、非再帰を指定できる
    - 「スタブリゾルバー→再起的問い合わせ→フルリゾルバー→非再起的問い合わせ→権威サーバー」という動きを再現できる
    - 再起的問い合わせは、問い合わせ先に再帰的な動きを要求するかどうかの意味であることに注意
      - フルリゾルバー→権威サーバーの問い合わせが再帰っぽいが、ここでは非再起的問い合わせ

- DNSのレスポンスの形式
  - https://jprs.jp/glossary/index.php?ID=0150

- Webサイトを公開する
  - Aレコード、またはAAAAレコードを登録する
    - ドメイン名とIPアドレスを紐づける
- Emailアドレスとして利用できるようにする
  - MXレコードとAレコード(またはAAAAレコード)に登録する
- ドメイン名のエイリアスをつける
  - CNAMEレコードを使う
    - CDNを使ってサイトを配信する場合など