desc "Seeds the database with default ForgeCMS data."
namespace :forgecms do
  namespace :db do
    task :seed do
      Forgecms::Engine.load_seed
    end
  end
end
