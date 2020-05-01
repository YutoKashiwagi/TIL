# Vue.jsを触ってみる

https://www.udemy.com/course/learn-vuejs/
こちらの動画でまず何ができるのかざっと確認し、その後Railsと組み合わせて簡単なアプリを作ってみたい

## ディレクティブ

v-で始まる、特別な属性のこと。Vueに何か特別な指示を行う仕組み

- v-bind
  - 属性へのデータバインディングは`{{}}`による直書きではなく、`v-bind:input="message"`というように書く
- v-if
  - 単体でfalseにするとDOMレベルで非表示になる(p要素にv-ifを指定した場合、そのp要素自体なくなる)
  - v-showにするとDOMレベルで非表示にするのではなく、display: none;を指定する
- v-for
  - 繰り返し処理
- v-on 
  - イベント処理
- v-model
  - 双方向データバインディング

## コンポーネント
UIパーツを作って使いまわせる

`Vue.component('コンポーネント名', コンポーネントの定義情報)`

## 算出プロパティ(computed), メソッド(methods)の違い
- 算出プロパティ
  - ()不要
  - getter, setter使える
  - キャッシュされる
- メソッド
  - ()必要
  - getterのみ
  - キャッシュされない
