# これは何？
- githubにGPGキーを登録します。
- SSHではなく、GPGを利用することで、SSHに比べてより良いことがいくつかあるようです。
    1. より高い安全性。
    1. いくつも公開鍵を持てるので、認証認可の管理が楽になる。


# ステップ
## gpgのインストールと登録

- pgpコマンドをインストールしてGPGキーを作れるようにする。

```bash
$ brew install gpg
```bash



```bash
$ gpg --quick-gen-key "{{表示したい名前}} <{{Githubに登録しているメールアドレス}}>" ed25519 default 0

例）gpg --quick-gen-key "EXAMPLE <example@gmail.com>" ed25519 default 0
```

GPGキーのIDを確認する。

```bash
$ gpg -k
```

以下のようになれば成功

```
[keyboxd]
---------
sec   ed25519/{{ID}} 2023-12-25 [SC]
      {GPGキーのID}
uid                 [ultimate] {{表示したい名前}} <{{Githubに登録しているメールアドレス}}
```

```bash
$ gpg --export -a {GPGキーのID} > pub.asc
```

```bash
$ brew install gh

$ gh gpg-key add pub.asc
```

以下のようになれば成功

```
✓ GPG key added to your account
```

念の為鍵のリストを表示して確認。

```bash
$ gh gpg-key list
```

> [参考資料](https://zenn.dev/yashikota/articles/d1840e4898c3bf)