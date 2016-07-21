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
          execute '$HOME/.rbenv/bin/rbenv exec bundle exec sidekiq --index 0 --pidfile /home/deploy/apps/bbcm/shared/tmp/pids/sidekiq-0.pid --environment production --logfile /home/deploy/apps/bbcm/shared/log/sidekiq.log --config /var/www/bbcm/current/config/sidekiq.yml --daemon'
        end
      end
    end
  end
end
