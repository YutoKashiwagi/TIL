# Rubyのクラスについてのメモ

## private, public, protected
- public => public に設定されたメソッドは制限なしに呼び出せます。
- protected => protected に設定されたメソッドは、そのメソッドを持つオブジェクトが self であるコンテキスト(メソッド定義式や instance_eval )でのみ呼び出せ ます。
- private => private に設定されたメソッドは関数形式でしか呼び出せません。
- https://qiita.com/tbpgr/items/6f1c0c7b77218f74c63e
