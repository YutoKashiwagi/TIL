- Webサービスを提供しているのであれば、Web APIは公開すべき
  - コアな機能を提供すべき
  - 利用してくれるユーザーが増えて盛り上がる
  - セキュリティ的な懸念はあるか？
    - アクセス制限はつけるべき
    - プライベートAPIでも、パブリックAPIとして公開できるレベルで設計するのが理想

- SSKDとLSUD
  - SSKD(Small Set of Known Developers)
    - private APIの利用者
  - LSUD(Large Set of Unknown Developers)
    - public APIの利用者

- Web APIを美しく設計する上で大事な思想
  - 仕様が決まっているものは、仕様に従う
  - 仕様が決まっていないものは、デファクトスタンダードに従う

- クエリパラメータとパスパラメータの使い分け
  - 一意のリソースを表すのに必要な情報かどうか
  - 省略可能かどうか

- ホスト、URLの共通部分について
  - よく、`api.example.com/v1/`, `example.com/api/v1`などが見られるが、`api`はホスト名に含めてしまった方が良い
    - uriが短くなり、アクセスもDNSレベルで分割できる

- SSKDとAPIデザイン
  - トップ画面など、複数のリソースを同時に表示する複雑なユースケースでは、リソース単位のAPIではなく専用のAPIを用意する手段もある
    - オーケストレーション層を挟む手もある

- HATEOAS
  - 一つのエンドポイントから別のエンドポイントのリンクを返していく

- データフォーマットの指定方法
  - HTTPの仕様に従うならばAcceptヘッダーだが、ほとんど使われていない
    - ほとんどのサービスでクエリパラメータが利用されている
      - クエリパラメータを使う方が難易度が低いから？

- レスポンスの内容をユーザーが選べるようにする方法
  - レスポンスに欲しいパラメータを指定させる
  - よく使ういくつかの値をグループとしておき（レスポンスグループ）、グループ名を指定する
    - Amazonがこのレスポンスグループ方式を活用

- JSONのトップレベルはオブジェクトにすべきか、配列にすべきか
  - オブジェクトで統一すべき
    - 配列だとJSONインジェクションを招く危険性があるため、オブジェクトで統一した方が無難

- 独自のHTTPヘッダーを追加する
  - 慣習的に`X-`というプレフィックスをつける（例: `X-GitHub-Request-Id: xxxxxxxxxxxxxxxxx`）
  - X-プレフィックスは非推奨という声もあるが、ついていると慣習的にわかりやすいのでついていても良さそう

- APIのバージョニング
  - v1, v2など整数がよく使われる。なぜセマンティックバージョニングではないのか？
    - APIのマイナーチェンジは利用者側にはそれほど意味がなく、破壊的な変更はメジャーバージョンアップであるべきなため
