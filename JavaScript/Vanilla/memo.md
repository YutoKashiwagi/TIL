# 素のJSについてのメモ

- アロー関数は使い捨ての関数
- コンストラクタは初期設定みたいなもの
- get: 値を取り出すためのもの, set: 値を変更するためのもの

## オブジェクトと配列の違い

- オブジェクトのキーは一意
- オブジェクトは配列のように順番が保証されていない。これは重要

## 関数宣言と関数式どちらを使うべきか

- constを使った関数式推奨。関数宣言はvarと同じ問題を抱えている
  - 再宣言と巻き上げ

```JS

function hoge() {
  return 'hoge'
}

function hoge() {
  return 'hogehoge'
}

console.log(hoge())  // hogehoge

```

## Nullish coalescingとOR演算子

OR演算子とよく似ている。

null と undefined 以外の falsy な値のときには左の値を返す

- [Nullish coalescing](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator)

```JS

const orFoo = 0 || 'foo'

const nullishCoalescingFoo = 0 ?? 'foo'

console.log(orFoo) // 'foo'
console.log(nullishCoalescingFoo) // '0'

const nullFoo = null ?? 'foo'
// nullかundefinedの時だけ、右の値を返す
console.log(nullFoo) // 'foo'

```
