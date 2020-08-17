# TypeScriptについてメモ

- `tsc --init`でtsconfif.jsonが生成される
## tsconfig.json
- 型チェックを弱くできる（デフォルトの設定をいくつかオフにできる。RuboCopの設定みたいな感じ）
- コンパイル対象のディレクトリと、出力先のディレクトリを指定できる
- declarationをtrueにすることで、型宣言ファイルを出力できる(実際の開発ではあんま使わない。ライブラリを開発する際、ライブラリを使う側に対して型情報を明記するくらい)