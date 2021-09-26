## 同一オリジンポリシー

あるオリジンでホストされているページから、異なるオリジンのリソースへアクセスできないようにする仕組み

> 同一オリジンポリシーとは、あるオリジンから読み込まれた文書やスクリプトについて、そのリソースから他のオリジンのリソースにアクセスできないように制限するものです。同一オリジンポリシーはウェブのセキュリティにおける重要な仕組みであり、悪意ある行動を起こしかねないリソースの分離を目的としています。

## IEにおける例外事項
https://developer.mozilla.org/ja/docs/Web/Security/Same-origin_policy#exceptions_in_internet_explorer

## 異なるオリジンへのネットワークアクセス

異なるオリジンへの
- 書き込み
  - 概して許可される
- 埋め込み
  - 概して許可される
- 読み込み
  - 一般的に許可されない
    - 埋め込みによって、読み取り権限がしばしば漏れ

## 異なるオリジンへのアクセスを許可する

- CORSを使用する
  - HTTPの一部で、サーバーがクライアントに、どのホストがそのサーバーからコンテンツを読み込むことが許可されているかを共有する機能

CORSとは？という説明にぴったりかも

https://developer.mozilla.org/ja/docs/Web/Security/Same-origin_policy#how_to_allow_cross-origin_access

## CORS

サーバーがクライアントに、どのホストがそのサーバーからコンテンツを読み込むことが許可されているかを共有する機能

- 使いどころ
  - webページが別のオリジンにホストされているリソースを読み込む場合、同一オリジンポリシーを回避するためにCORSの設定を行う必要がある

- オリジン間リソース共有の仕様は、ウェブブラウザーから情報を読み取ることを許可されているオリジンをサーバーが記述することができる、新たな HTTP ヘッダーを追加することで作用します

- 単純でないリクエストの場合、ブラウザはプリフライトリクエストを行い、その複雑なリクエストが許可されているかサーバーに問い合わせる

- CORSのエラーはJSから知ることはできない
  - セキュリティ上の理由から、コード上からエラーが発生したということはわからないようになっている

- XHR、Fetch APIはデフォルトでは資格情報を送信しないため、視覚情報を送信する場合はWithCredentialフラグを設定する
  - リクエストを受け取るサーバー側で[Access-Control-Allow-Credentials](https://developer.mozilla.org/ja/docs/Web/HTTP/CORS#access-control-allow-credentials)を設定する。これを設定することで、ブラウザがレスポンスを開示できる

## 同一オリジンポリシーとは

あるオリジンでホストされているページから、異なるオリジンのリソースへアクセスできないようにする仕組み

## CORSとは

サーバーがクライアントに、どのホストがそのサーバーからコンテンツを読み込むことが許可されているかを共有する機能。同一オリジンポリシーを緩和するために使う

- 使いどころ
  - webページが別のオリジンにホストされているリソースを読み込む場合、同一オリジンポリシーを回避するためにCORSの設定を行う必要がある

- CORSは、サーバー側でどのホストがそのサーバーからコンテンツを読み込むことが許可されているかを共有するHTTPレスポンスヘッダーを追加することで機能する

- 単純でないリクエストの場合、ブラウザはプリフライトリクエストを行い、その複雑なリクエストが許可されているかサーバーに問い合わせる

- CORSのエラーはJSから知ることはできない
  - セキュリティ上の理由から、コード上からエラーが発生したということはわからないようになっている

- XHR、Fetch APIはデフォルトでは資格情報を送信しないため、資格情報を送信する場合はWithCredentialフラグを設定する
  - リクエストを受け取るサーバー側で[Access-Control-Allow-Credentials](https://developer.mozilla.org/ja/docs/Web/HTTP/CORS#access-control-allow-credentials)を設定する。これを設定することで、ブラウザがレスポンスを開示できる

# Origin解体新書

- OriginはWebにおける重要なセキュリティモデル

- SOPの実態
  - あるオリジンのコンテンツからは、別のオリジンのコンテンツからしかアクセスできないという制限
    - これがあることで、自分がアクセス権限を持つイントラネットの情報などが、悪意のあるサイトを訪問した時に勝手に抜き取られるようなことがなくなる

- なぜSchema, Host, Portの完全一致なのか
  - Port
    - 開発環境でPortを分けていたりする場合、開発環境が狙われる
    - 開発環境以外にも異なるPortでいろいろなサービスがデプロイされている場合が多く、攻撃される隙が多くなる
  - Schema
    - httpだと経路が暗号化されていないため、途中で改竄されて悪意のあるJSが埋め込まれる可能性がある

- CORSでエラーが出た時、リクエスト自体は送られている
  - レスポンス取得後、ブラウザがエラーを出す
  - なぜリクエスト前にエラーにしないか
    - サーバー側でCORS設定ができなくなるから

## なぜCORS

- Access-Control-Allow-Origin
  - ブラウザで、異なるオリジンへのリクエストの送信を禁止すると、APIを分けたりすることができなくなる
  - サーバー側で全てのオリジンからのリクエストを許可すると、攻撃され放題になる
  - そこで、Access-Control-Allow-Originヘッダーを使ってサーバー側でリクエストを許可するオリジンを指定するという方法が採択された

- CORSの目的
  - デフォルトで禁止されている理由
    - デフォルトのセキュリティを高めるため
  - CORSで緩和できる理由
    - サーバーごとにリソースが分離されたWebサービスを作りやすくするため
      - バックとフロントを分離しているサービスなど

- プリフライトリクエスト
  - 副作用のあるリクエストの場合、リクエストを送ってからブラウザでレスポンスの開示を制御するやり方だと、副作用を許可する事になる
    - そこで、副作用のあるリクエストの場合はリクエスト送信前にサーバーに許可を問い合わせる、プリフライトリクエストが行われる
  - この仕組みもあり、GETで副作用のあるリクエストを送ることはやはり危険

- Access-Control-Max-Age
  - 毎回プリフライトリクエストを送ると遅いため、副作用の許可をキャッシュする仕組み

### ヘッダと資格情報
- Access-Control-Expose-Header
  - デフォルトではセキュリティ上の理由で開示されるヘッダーが制限されているため、その緩和のために使う

- Access-Control-Allow-Credentials
  - うっかりミスを防ぐため
    - Access-Controle-Allow-Originだけだと、うっかりcookieの送信を許可してしまう可能
  うyUY/¥`性があり不十分なため、資格情報はデフォルトで送信送信しないようになっている
      - その緩和
  - これをtrueにする場合、他のAccess-Control系ヘッダはワイルドカードが使えなくなる（うっかりミス防止のため）

### プリフライトリクエストが飛ぶ条件
- simple requestの定義を覚えるのではなく、preflight requestが飛ぶ条件を理解する方が大事

- 副作用が起こるリクエストにはpreflightが必要？
  - form POSTはpreflightが飛ばない
    - form POSTはCORS以前から存在するため、fetch APIでエラーにしてもform POSTで抜けられるから
      - form POSTで異なるオリジンにPOSTリクエストを行うことは以前から可能（CSRF）

- simple requestとは
  - 副作用を起こすものではなく、 ブラウザがデフォルトで送信できるリクエストのこと
    - `<a>`、`<img>`、`<script>`、`<link>`などから発生する GET
    - `<form>`から発生する GET/POST

## fetch APIとは
- 「ブラウザから何かを取得する(fetching)とはどういう処理か」をまとめた[Fetch](https://fetch.spec.whatwg.org/)という仕様をJSのAPIに落とし込んだもの
  - 単純にXHRを簡単にしただけではない

## Originを安全に跨ぐ
- 跨ぐ方法
  - 安全
    - Originの仕様策定後に提供された、安全に跨ぐ手段
      - Message Channel
        - 受け取る側でアクセスコントロールができるため、罠サイトから悪用される可能性が少ない
      - WebSocket
  - 危険
    - Originの仕様策定以前からWebに残ってしまっている仕様
      - form POST
        - CSRF対策
          - token
          - Refererの付与
            - サイト内でのReferer付与はプライバシー上問題ない
          - 重要なCookieのSame-Site属性をLax以上にする
            - これだけで大抵防げる

## Spectre

> 本来アクセスできないはずの「別プロセスにあるメモリ」を、 CPU の投機的実行という特性を利用してキャッシュに載せ、それを推測することでアクセスできるという脆弱性

- ブラウザのプロセスアーキテクチャレベルで改善が必要
- URLにアクセスするだけで様々なコードが実行できるWebが被害を受けやすい

###  Spectre対策

異なるオリジンのデータを、同じメモリ内に読み込まないという方針

- CORB: Cross Origin Read Blocking
  - 異なるオリジンのリソースをscriptタグやimgタグで読み込む時、HTMLやJSからはアクセスできないが、ブラウザのメモリ上には展開されているのでSpectreで盗まれる可能性がある
    - 悪意のあるリクエストに対して、ブラウザがレスポンスを破棄してくれる

- [CORP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cross-Origin_Resource_Policy_(CORP))
  - CORBと同じことを開発側がopt-inで行える仕組み
    - CORPヘッダーを付与することで、CORBより高いレベルでクロスオリジンでの読み取りを防げる
  
- COEP: Cross Origin Embedder Policy
  - そのページのCORPが全ての外部リソースに対して適用されていることを確認する
- COOP: Cross Origin Opener Policy
  - Opener / Openee 両方に指定し、その両方の値が整合しなければ window.opener が削除されるという仕様

- Site Isolation
  - CORP, COEP, COOPが全て指定された状態
    - そのページと同じプロセスに展開されるのは明示的に許可されたもののみという状態を保証する

## メモ

- なぜこういう方式が導入されたか？別の案だとどうなるか？の意思決定まで書いてあって勉強になる