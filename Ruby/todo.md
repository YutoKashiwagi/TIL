# Rubyについて学んだことをメモ

## 勘違いしてた部分

関数を使って加算したいとき

```
balance = 0

def plus_30(balance)
  balance + 30
end

3.times do
  balance = plus_30(balance)
end
```
## 重複した要素を一つだけ削除する

参考: http://simanman.hatenablog.com/entry/2013/03/20/013808

## parse
データ(JSONなど)をRubyオブジェクトに変換する

https://docs.ruby-lang.org/ja/latest/method/JSON/m/parse.html
