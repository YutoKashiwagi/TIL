# RepositoryFactoryパターン

[参考](https://www.ritolab.com/entry/176)

## Repository / Factory

- Repository
  - 永続化を隠蔽する
- Factory
  - オブジェクトを生成する

Repositoryに永続化したい処理やエンティティを集めておき、FactoryでRepositoryを取得する流れ

## 具体例

- Repository
  - Repository.js
      - axiosのカスタマイズ
    - Entities
      - userRepository.js
        - ユーザーにまつわる処理を書く（ユーザー登録など）
- RepositoryFactory
  - RepositoryFactory.js
    - Repositoryをゲッターに登録し、ここから取得できるようにする

これでコンポーネント側では以下のようなコードが書けるようになる
```
export default {
  methods: {
    async send () {
      try {
        const response = await UserRepository.register({
          email: hogehoge@hogehoge.com,
          password: hogehoge,
          passowrd_cofirmation: hogehoge
        })
        // 成功時の処理
      } catch {
        // 失敗時の処理
      }
    }
  }
}
```

## 所感
- コンポーネントに処理をベタ書きしなくてよくなるので、可読性がかなり上がりそう
- 責務もきちんと分散できそう
  - 拡張性がかなり高くなりそう
- コンポーネントの肥大化を防げそう
- 何をどこに書くべきか迷いそう
  - BFFをかましてる場合、BFFでもフロントでもやるのかという問題が出てきそう
  - バリデーションをどこに書くべきか

## 結論
導入は手間だが、変更、保守、拡張に強くなりそうなのでやってみたい
