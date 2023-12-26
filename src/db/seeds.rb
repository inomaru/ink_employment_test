if User.where(auth_level: 'admin').count == 0
  User.create([
    {
      email: 'first_admin_user@example.com',
      password: 'Password111111??!',
      auth_level: 'admin',
    }
  ])
end