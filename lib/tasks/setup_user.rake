desc "setup initial users & roles"
task :setup_user => :environment do 
Role.create(name: "super_admin")
Role.create(name: "admin")
Role.create(name: "user")
Role.create(name: "client")

User.create(email: "pallu.hegde93@gmail.com", password: "pall123")
Permission.create(user_id: User.find_by_email("pallu.hegde93@gmail.com").id,role_id: Role.first.id)

user = User.where('email != ?', "pallu.hegde93@gmail.com")
for user in users
  user.roles << Role.find_by_name("user")
end
end