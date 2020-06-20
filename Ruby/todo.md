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
