# API連携で詰まらないために
HTTP, エラーオブジェクト、axiosを雰囲気で使っているため、意図しないリクエストが返ってきたときの原因を突き止めるのによく詰まってしまう。`[object Object]`とかが出てきてよく詰まる

ちゃんとデバッグするために、それぞれ基本的なところから調べた

## エラーオブジェクト

https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Error

- プロパティ
  - error.message
    - 第一引数のmessageを表示
  - error.name
    - エラー名を表示

### エラーを投げる
基本的にErrorオブジェクトのインスタンスを投げる。スタックトレースなどのデバッグ情報を持っているから

- 独自のエラーを投げる
  - `throw new Error('独自のエラー')`
- ビルトインエラーを投げる
  - `throw new TypeError('型エラー')`

### エラーハンドリングで`[object Object]`が出てくる
Errorオブジェクトにオブジェクトを渡しているとうなる。よくレスポンスをそのまま渡して発生させてしまうので気をつける
```
try {
  const hogehoge = {
    hgoe: 'hoge'
  }
  throw new Error(hogehoge)
} catch (e) {
  console.log(e)
}
// =>
Error: [object Object]
```

## HTTP
[参考](https://webtan.impress.co.jp/e/2010/01/12/7156)
- HTTP
  - ブラウザとwebサーバーの通信プロトコル
- リクエスト
  - ブラウザがサーバーに送るやつ
- レスポンス
  - リクエストを受けてサーバーがブラウザに返すやつ

### HTTPリクエスト

- HTTPリクエスト行
  - HTTPリクエストの一行目
  - 以下の三つのパートから成る
    - メソッド: GETとかPOSTとか
    - URL
    - HTTPのバージョン

#### HTTPヘッダー
- ユーザーエージェント名(User-Agent)
  - ブラウザの種類やOSの情報
- リファラー: どのページからリクエストが来たのかなど
- If-Modified-Since / If-Non-Match
  - ブラウザは一度キャッシュしたデータをローカルキャッシュとして保存している
  - ファイルの変更の日付や管理情報をリクエストに含めておき、変更を検知
- Cookie
- Accept: 受け取りたい情報の確認
  - Accept-Langage
  - Accept-Encoding
  - Accept-Charsetなど

### HTTPレスポンス
- サーバーがブラウザに送る
- 以下の三つのパートからなる
  - レスポンス状態行: 200とか404とかのステータスコード
  - HTTPヘッダー
  - データ本体

## axios

- https://github.com/axios/axios

雰囲気で使ってるので、リクエストがうまくいかないとよくハマってしまう。レスポンスを中心に調べた

```
try {
  const response = axios.post(url, json)
  /// 成功時の処理
} catch(error) {
  console.log(error.response)
}
```

こんな感じのコードをよく書くけど、axiosインスタンスに対してどんなメソッドが使えるか、どんな条件でエラーを投げるのかよくわかってない

### axiosインスタンスがエラーを投げるとき

デフォルトではレスポンスのステータスコードが200系以外エラーになるが、何をエラーとするかは変更できる

- [ソースコード](https://github.com/axios/axios/blob/0d8765562401910c1c509f6739a3bc558721e123/dist/axios.js#L931)
- [参考記事](https://www.yoheim.net/blog.php?q=20170801)

### axiosインスタンス
公式に書いてあった

[レスポンススキーマ(公式)](https://github.com/axios/axios#response-schema)
