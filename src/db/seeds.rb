if User.where(auth_level: 'admin').count == 0
  User.create([
    {
      email: 'first_admin_user@example.com',
      password: 'Password111111??!',
      auth_level: 'admin',
    },
    {
      email: 'un_admin_user@example.com',
      password: 'Password111111??!',
    },
  ])
end
# 最大ユーザー数40人から上記の人数を引いた数
38.times do |n|
  User.create(
      email: "user_#{n}@example.com",
      password: 'Password111111??!',
      auth_level: "#{n%2==0 ? 'admin' : 'user'}",
   )
end