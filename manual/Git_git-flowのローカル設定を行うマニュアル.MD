# これは何？
- terminalでgitを利用する設定
- こちらの設定をしておくと、local<->remoteでスムーズにgitを利用できるようになります。
- [ed25519形式のsshキーを作成する](ed25519形式のsshキーを作成する.MD)と一緒にご利用ください。


## GitにGPGキーを登録

```bash
$ git config --global gpg.program gpg
$ git config --global user.signingkey {GPGキーのID}
```

```bash
git config --global commit.gpgsign true
git config --global tag.gpgsign true
```


## Vscodeの場合
うまく起動しないことがあるので以下のコマンドを実行

```bash
$ export GPG_TTY=$(tty)
```

> [参考資料](https://qiita.com/goahi/items/493ff01b8fc86539f885)