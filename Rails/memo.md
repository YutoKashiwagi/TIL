# Railsについてのメモ

## auto_loadとは

Rubyでは他のファイルを読み込むのにrequireする必要があるが、Railsにはauto_loadという機能があり、命名規則に従っていればrequire不要になっている

auto_loadは非推奨

- https://qiita.com/hirokisoccer/items/4ba62a56b18eb834a8ee
- https://railsdoc.com/page/config_autoload_paths

# rails g scaffoldとg resourceの違い
- scaffold: コントローラ、ビューの中身まで生成する
- resource: コントローラ、ビューの中身までは生成しない
