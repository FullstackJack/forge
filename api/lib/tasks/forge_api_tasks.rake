namespace :forge do
  namespace :db do
    desc "Seeds the database with default ForgeCMS data."
    task :seed do
      Forge::Api::Engine.load_seed
    end
  end
end
