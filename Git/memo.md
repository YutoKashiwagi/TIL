# Gitちゃんと学ぶ

雰囲気で使ってるのでいい加減ちゃんとやる

[学習ロードマップ](https://qiita.com/thinkalot/items/b3c2e9060f46f5d4ea46)

## 入門編
[資料](https://www.slideshare.net/taniguchimakoto/git-37626657?next_slideshow=1)

### リポジトリ周り
- ローカル
  - ローカルリポジトリ: コミット履歴
  - インデックス: addしたやつ(ステージング)
  - ワークツリー: 作業フォルダ
- リモート
  - リモートリポジトリ

### マージとrebaseの違い
- マージは統合。いろんなコミットを合体させてひとつにする
- リベースは付け替えてひとつにする

### マージ

- fast-forward: そのままくっつける
- non-fast-forward: マージの記録を残す

### その他
- タグを使うと便利
- HEADは作業中のブランチのこと

### reflog
- [参考](https://gist.github.com/kymmt90/9c997726b638b316f9be07aa4e3eea5e)
- reflogはずっと残っているわけではないので、reflogがあるから大丈夫的な考え方はダメ
  - デフォルトの保存期間は90日
  - [参考](https://qiita.com/cushy79/items/248659b5b814f1deceee#%E4%BE%BF%E5%88%A9%E3%81%AAgit%E3%82%B5%E3%83%96%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%894%E9%81%B8)

### ユースケース
- 直前のマージを取り消す
  -  `git merge --abort`
- コミットを打ち消す
  - 履歴に残して打ち消す
    - `git revert`
  - 履歴に残さず打ち消す（そのコミットから先をなかったことにする）
    - `git reset`
