# PHPについてメモ

- インタプリタ言語
- apach上で動作
- 定数の定義方法: `define(識別子, 値);`

- [クロージャ](https://www.php.net/manual/ja/functions.anonymous.php)
  - JSとは違うっぽい？
    - ほぼ同じ挙動ができるっぽい

```PHP

<?php

function a() {
  $hoge = 0;

  // &で参照渡し
  return function() use (&$hoge)  {
    ++$hoge;
    return $hoge;
  };
}

$b = a();
echo $b().PHP_EOL; // 1
echo $b().PHP_EOL; // 2

```


- マジックメソッド
  - [参考記事](https://qiita.com/ichi_404/items/257b2c23aacef0b3cfdc)
  - 公式読んでも概念がちょっとわかりにくかった


## クラス

- メンバ変数: クラスに値を保存する
  - アクセス修飾子: public, private, protected
    - public: クラス内外からアクセス可能
    - private: クラス内からアクセス可能
    - protected: 同クラス及び子クラスからアクセス可能。継承のとき使う
- メンバメソッド:
- 定数: クラス内での定数の書き方は少し異なる。constを使ってJSのように書く
