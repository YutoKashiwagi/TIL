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

### カーディナリティ(濃度)
- 列に入っている値の種類の多さ
  - 種類が多い(nameカラムなど): カーディナリティが高い
  - 種類が少ない(genderカラムなど): カーディナリティが低い

## 結合について
from, selectで結合することもできるが、それだと結合条件と絞り込み条件が分離できず、わかりにくい。join, onを使うことで結合条件と絞り込み条件を分離できる

### 内部、外部結合
二つのテーブルをある条件で結合する時、条件に合致する部分を内部、合致しない部分を外部としている。ベン図で考えるとわかりやすい
- left/right join(left/right outer join): 外部の内、右と左のどちらのテーブルを結合して活用するかの問題
- full join(full outer join): 外部も全て含めて取り出す 

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

## テーブルについて

### 一対多
外部キーに複数の値を入れられないため、多が一を参照するように作る

### 多対多
交差テーブルを作る

### ツリー構造
一対多を構造化したもの

## インデックスについて
- データ量が多く、頻繁に検索を行う場合は有効。データ量が少ない場合は無駄
- インデックス内で検索してデータが見つからない場合、テーブルまで探さずに処理が終わる
- テーブルの中から条件に合うごく少数のレコードを探し当てるのに向いている
- シーケンシャルスキャン、インデックススキャンのうちどちらが使われるかはDBが判断
- カーディナリティが高いカラムに対して有効
- 絞り込みの際、比較式に関数が入っているとインデックスは使えない
  - 列名ではなく式を使ったインデックスを貼っておくことはできる(式インデックス)

## カバリングインデックス

インデックススキャンのみで完結するクエリ(テーブルアクセスしない)

### 注意点
- 行の挿入や変更は少し遅くなる
- 大量データを登録するときは、インデックスを外すのもあり
- インデックス作成はテーブルをロックしてしまう

## 日付と日時
- 日付型: date
- 日時型: timestamp

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

### Window関数

```SQL

SELECT *, sum(u.height) over (
  PARTITION BY u.gender ORDER BY u.id
  )
FROM users

```

- partition
  - テーブルをパーティションごとに分割する
    - group byはグループ化後の操作対象がグループに限定されるが、partition byは操作対象が行のまま

- ウィンドウフレーム
  - window関数の操作対象
    - order by句がある場合
      - パーティション内の先頭行から現在行までがウィンドウフレームとなる
    - order by句がない場合
      - パーティション内の先頭行から最終行までがウィンドウフレームとなる
    - over句の中のorder byに指定した行に同じ値が含まれる場合、同じ値を持つ行はウィンドウフレームに混ざるので注意
      - 重複しないようにする（order byに複数のカラムを指定するとか）
