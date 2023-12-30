# これは何？
- Githubサービスに公開鍵の登録を行います。
- [ed25519形式のsshキーを作成する.MD](ed25519形式のsshキーを作成する.MD)で作成したed25519形式の秘密鍵を使ってgithubにアクセスできるようになります。



# ステップ
## 公開鍵を確認

```bash
$ cat ~/.ssh/id_ed25519.pub
```


## GithubへSSHキーを登録

1. アイコンをクリック
1. settings
1. SSH and GPG keys
1. New SSH key
    1. titleは `適当なもの` を入力
        - 例）ED_SSH_PUB_KEY_231225
    1. Key typeは `Authentication Key`
    1. Keyに `先ほど確認したキー` を設定


## 接続を確認

```bash
$ git clone {リポジトリのSSH URL}
```