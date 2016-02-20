EmberCli.configure do |c|
  c.app :frontend
  c.app :admin, { path: Rails.root.join('admin') }
end
