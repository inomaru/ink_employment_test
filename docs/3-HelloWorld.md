# 第三問：Hello,World

1. 下記要件を満たす`Pull Request`を `ネストしたfeatureブランチ` として作成し、適切なブランチに向けてください。

## 要件

1. RailsのWelcomeページが、`localhost:3000` ではなく、`https://emp-test.localhost` にてアクセス可能なように設定してください。
  - 事前手順が必要な場合は、`manual` 以下に Markdown形式で格納ください。
  - なんのWebサービスも使用しないものとし、ローカルで完結するようにしてください。
2. `https://emp-test.localhost/hello_world` にアクセスすると、`<h1>Hello,World</h1>` が表示されるようにしてください。
3. `https://emp-test.localhost/api/hello_world` にアクセスすると、`{"message": "Hello,World", status: 200}` がjson形式で返却されるようにしてください。