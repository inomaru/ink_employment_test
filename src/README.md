# テストを実行する
### 全てのテストを実行
```bash
$ docker-compose exec rails rails test
```

### エイリアスを設定してコマンドを短く
```bash
$ alias rails='docker-compose exec rails rails'
$ rails test
```