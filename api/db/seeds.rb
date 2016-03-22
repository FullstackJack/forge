#require_dependency 'create_admin_service'

# Create default admin user
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
user = Forge::User.new
user.first_name = 'Admin'
user.last_name = 'Person'
user.email = 'admin@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.admin!
user.save!