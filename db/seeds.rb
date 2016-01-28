require_dependency 'create_admin_service'

# Create default admin user
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email