# TypeScriptについてメモ

- `tsc --init`でtsconfif.jsonが生成される
## teconfig.json
- 型チェックを弱くできる（デフォルトの設定をいくつかオフにできる。RuboCopの設定みたいな感じ）
- コンパイル対象のディレクトリと、出力先のディレクトリを指定できる
- declarationをtrueにすることで、型宣言ファイルを出力できる(実際の開発ではあんま使わない。ライブラリを開発する際、ライブラリを使う側に対して型情報を明記するくらい)
- バニラに対しても型推論ができる
  - allowJS, checkJS
  - バニラからTSに移行する際に活用すると良い
- ライブラリにも型定義が用意されているものが多い(@type, types, typeRootsなど)

## ビルド

- 実際の開発ではtscコマンドを使ってビルドすることは少ない。各種ビルドツールを使う
- webpack, Gulp, Grantなどがトランスパイルしてくれる

## 型注釈
- 関数の引数、戻り値それぞれに対して型注釈を付与できる

## 型
- unknown型
  - 型安全なany
- Intersection Types
  - 複数の型を一つに結合
- Union Types
  - `string | number | null`など、複数の型のうち一つを許容する。これを使ってNullableを表現できる
- Literal Types
  - 文字列リテラル: `let user: 'taro'`この変数userは`'taro'`しか許容しない。こんな感じでプリミティブ型と値をセットで指定できる。ユニオンタイプと合わせて使ったりする
  - 数値、真偽知も上と同じことができる
- typeofキーワード
  - 型クエリーと呼ばれるもので、宣言済み変数の型を取得できる
- keyofキーワード
  - オブジェクトのプロパティ名称をString Literal Union Typeで取得できる
  - `keyof typeof`という感じでtypeofと併用することも

```TypeScript

interface Person {
  name: string;
  age: number;
  location: string;
}

type K1 = keyof Person; // "name" | "age" | "location"
type K2 = keyof Person[]; // "length" | "push" | "pop" | "concat" | ...
type K3 = keyof { [x: string]: Person }; // string

// 公式より、keyofのサンプル
```

- enum
  - 列挙型。[非推奨](https://engineering.linecorp.com/ja/blog/typescript-enum-tree-shaking/)

- Generics
  - 型を変数のように使える
  - T, U, Kなどが慣習的に利用されることが多い
  - 関数の引数のように型に初期値を入れたり、宣言可能な型を制限できる
  - クラスや関数を組み合わせて使える

```TypeScript

interface Hoge<T> {
  value: T
}

const hoge: Hoge<string> = {
  value: 'hoge'
}

// 初期値がString
interface DefaultIsString<U = string> {
  value: U
}

const hoge2: DefaultIsString = {
  value: 'string'
}

const hoge3: DefaultIsString<number> = {
  value: 1
}

// 指定可能な型を制限
interface StringOrNumber<K extends string | number> {
  value: K
}

const hoge4: StringOrNumber<string> = {
  value: 'string'
}

const hoge5: StringOrNumber<number> = {
  value: 1
}

const hoge6: StringOrNumber<boolean> = {
  value: true // Error: 型 'boolean' は制約 'string | number' を満たしていません。
}

```


## コンパイルエラーを得るために
> コンパイルエラーを得やすいコードほど厳格性が高まり、バグを含みにくくなります
実践TypeScriptより

- 引数に型注釈
- 戻り値に型注釈
- 引数には全て型注釈を入れるのが望ましい
- object型はBraceではなく、object型を使う

## 抽象度による型安全

TSとプログラマのどちらが型について詳しいのか

- 抽象的な型
  - 広く受け付ける
- 詳細な型
  - 決まった型しか受け付けない分、型安全が担保されている

- ダウンキャスト
  - 抽象型→詳細型
  - ダウンキャストを行う場合、プログラマは型について責任を持たねばならない

- アップキャスト
  - 詳細型→抽象型
  - 明確な理由がなければ、型推論に頼るべき

## インデックスシグネチャ
- オブジェクトに対して、型指定したプロパティを動的に追加したいときに使う
  - 型安全でなくなる危険性があるので、Union Typeで型を制限しておく

## 型の互換性

{}, 関数、クラスは構造的部分型で互換性チェックしている

- 関数の互換性
  - 全ての引数の型

- クラスの互換性
  - インスタンスのメンバーのみが対象となり、コンストラクターの型は対象にならない

## open-ended

同じ名前の宣言があったとき、自動でマージされる性質のこと

[参考](https://developer.hatenastaff.com/entry/2016/06/27/140931#Open-ended)

- interfaceはopen-ended
- type aliasは非open-ended


