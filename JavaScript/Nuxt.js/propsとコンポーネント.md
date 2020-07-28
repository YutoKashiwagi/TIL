# propsとコンポーネント

## 参考
- [propsとは](https://note.com/aliz/n/n99144d4556b9)

## やりたいこと
リンク用のボタンとして使うコンポーネントに対して、呼び出し時にリンクを指定したい

## 書き方

### コンポーネント側
```
// LinkButton.vue
<template>
  <nuxt-link :to="hogeLink">
    <slot name="link-text"></slot>
  </nuxt-link>
</template>

<script>
export default {
  props: {
    hogeLink: {
      type: String,
      default: '/'
    }
  }
}
</script>

### 呼び出し側
<template>
  <LinkButton hogeLink="/hoge">
    <slot #link-text>リンク用のボタン</slot>
  </LinkButton>
</template>

<script>
// 略
</script>
