## 起きたこと
BFFでレスポンスを受けるとき、`set-cookie`に配列形式で複数の値を入れたいが、一つしか入らない

## 原因
expressのres.setHeaderで一つ一つeachで入れていたが、これだと配列形式で入れているのではなく、一つ一つ上書きしているだけ

```
export const setCookie = (res, headers) => {
  const cookie = headers['set-cookie']
  cookie.forEach((s) => {
    console.log(s)
    res.setHeader('Set-Cookie', s)
  })
}
```

## 正解
res.setHeader('Set-Cookie', cookieの配列)で配列ごと一気に入れる

[ドキュメント: res.setHeader()](https://nodejs.org/api/http.html#http_response_setheader_name_value)

```
export const setCookie = (res, headers) => {
  const cookie = headers['set-cookie']
  res.setHeader('Set-Cookie', cookie)
}
```

## 参考記事
https://github.com/expressjs/session/issues/692

## 所感

フロントは常にCookiesの値を気にしてないと死ぬ
