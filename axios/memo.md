# axiosについてメモ

## Nuxt
### Nuxt上で、$axiosを使うかインポートして使うかの問題

- `$axios`: Nuxtの組み込みaxios。axiosインスタンスのカスタマイズが不要。nuxt側では基本$axiosで良いらしい

- `import axios from 'axios'`: ページ単位でカスタマイズが可能。自由にカスタマイズしたいときはこちらを使う。BFFではこちらしか使えない？
