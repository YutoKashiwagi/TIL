# メソッドについて新しく気づいたことや学んだことを雑に記す

## tryと&.の違い

どちらもnil対策に雑に使っていたが、仕様が異なるのでちゃんと使い分ける必要がある
- try
  - 公式: https://railsdoc.com/page/try
  - Railsのactive_supportにより提供されるメソッド
  - nilに対して`NoMethodError`を出さないために使っていたが、本来はnilだけでなく、レシーバに対してメソッドを実行することができる場合のみメソッドを実行するという役割
  - try!は&.と同じ挙動だが、&.の方が高速に処理できる
  - 例)
    - `nil.try(:to_s) # => nil(nilに対してto_sは呼び出せないため、実行をやめてnilを返している)`
    - `777.try(:hoge) # => nil(integerクラスのインスタンスに対してhogeというメソッドは呼び出せないため、nilを返している)`

- &.(ぼっち演算子)
  - Rubyに元々組み込まれているメソッド
  - nilに対してメソッドを実行すると、メソッドを呼び出さずnilを返す
  - 例)
    - `nil&.to_s # => nil(nilに対してメソッドを呼び出しているため、呼び出しが行われずnilを返している)`
    - `777&.hoge # => NoMethodError (undefined method `hoge' for 777:Integer)(integerクラスのインスタンスに対してhogeというメソッドは呼び出せないため、エラーが発生)`

## 参考
コメント欄も参考になる
https://qiita.com/arakawashintaro/items/526fafa785486e53e46e
