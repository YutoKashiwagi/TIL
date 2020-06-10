# SQLについて、知らなかったことや忘れやすいことをメモ

## 実行順序
初心者のうちは、
- selctは一番最後
- それ以外は上から順番
という認識でOKらしい

https://qiita.com/yurina0402/items/78ae1f536b6755d6221a

## 考え方
### グループ化
何らかのキーを使って、行をいくつかのグループにまとめること

### エラーが出る時
実行順序や参照先を気にする

## 結合について
from, selectで結合することもできるが、それだと結合条件と絞り込み条件が分離できず、わかりにくい。join, onを使うことで結合条件と絞り込み条件を分離できる

## 関数について

### coalesce(発音はkōəˈles)
値がnullの時、指定した値を返す
- `coalesce(x, 'hoge') # => xがnullならhogeを返す`

## 演算子

### exists演算子
- 右側にサブクエリを入れ、一件でもレコードが見つかればtrue, 見つからなければfalseを返す
- レコードが見つかった時点で処理を終了する。countは全て集計する

### all演算子
- 右側にサブクエリを入れ、サブクエリの結果が全て真ならtrueを返す
- `select 40 <= all (select score from test_scores where subject = '社会'); # => 社会の点数が全て40点以上ならtrueを返す`

### any演算子
- allの否定

## 句について
### count
- count(*)はnullも数える
- count(height)はheightカラムをnullを含まずに数える

### group by
- グループごとに集計するために使う
- `group by 式(列名を含む)`
- group byを使う場合、select句ではグループ化のキー、集約関数しか指定できない(order byも)
  - group byを使うと、selectやorder byの対象が列ではなくグループになるから
  - グループ化のキーがidの場合は例外
```
select gender, count(*)
from members
group by gender
```

### having
`group by`で指定したグループに対して、さらに条件を指定する
- whereは行を対象とする
- havingはグループを対象とする

### limit
`limit n`で先頭からn行指定

### offset
`offset n`で先頭からn行をスキップ

### limitとoffsetを同時に使った場合
実行順はoffsetが先

### update
update文は一度に複数の行を更新するのが苦手

```
id | name | age 
-----+-------+----- 
101|Alice | 21 
102|Bob   | 27 
103|Cathy | 23
(3 rows)
```

このテーブルに対して、「AliceとCathyの年齢を1つ増やす」のは得意だが、「Alice の年齢を21歳に、Cathyの年齢を23歳に更新する」というのは苦手。この場合、二回update文を実行するのがよい。`一つの列に対して複数の値や式を指定できない`
