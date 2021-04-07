# Rubyのクラスについてのメモ

```Ruby

# 参考: https://qiita.com/Fendo181/items/eb2cb17f32d99aa01f59#%E3%82%AF%E3%83%A9%E3%82%B9

class User
  # クラス変数
  @@count = 0

  # コンストラクタ
  def initialize(name)
    # インスタンス変数
    @name = name
  end

  # インスタンスメソッド
  def hello
    puts "hello #{@name}"
  end

  #クラスメソッド
  def self.show_count
    puts "count is #{@@count}"
  end
end


user = User.new("hoge")

user.hello # hello hoge

User.show_count # count is 0

```

## private, public, protected
- public => public に設定されたメソッドは制限なしに呼び出せます。
- protected => protected に設定されたメソッドは、そのメソッドを持つオブジェクトが self であるコンテキスト(メソッド定義式や instance_eval )でのみ呼び出せ ます。
- private => private に設定されたメソッドは関数形式でしか呼び出せません。
- https://qiita.com/tbpgr/items/6f1c0c7b77218f74c63e
