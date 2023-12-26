# これは何？
- Docker環境でRailsを動かす初期設定を行います。
- ここでは、ドメインに関する設定を行います。
- 通常、`http://localhost:3000/`でアクセスするところを、`https://emp-test.localhost/`でアクセスできるようにMac側で設定する必要があります。



# ステップ
## localhostの設定を追加
- 下記をMac側設定し、`docker-compose.yml`の`https-portal`サービスと組みわせる。
- 注意
    - 下記の設定はコンテナ内で行うものではありません。
    - マシン（mac）の中で行ってください。

```dat:/etc/hosts
echo '127.0.0.1 emp-test.localhost' >> /etc/hosts
```