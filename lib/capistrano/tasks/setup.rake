namespace :setup do
  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end
  
  desc "Start sidekiq"
  task :sidekiq do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute 'bundle exec sidekiq -e production'
        end
      end
    end
  end
end
