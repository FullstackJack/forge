namespace :forgecms do
  namespace :db do
    desc "Seeds the database with default ForgeCMS data."
    task :seed do
      Forgecms::Engine.load_seed
    end
  end
end
