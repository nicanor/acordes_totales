# encoding: utf-8
namespace :deploy do
  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! "config/database.example.yml", "#{shared_path}/config/database.yml"
      upload! "config/nginx.conf", "#{shared_path}/config/nginx.conf"
      upload! "config/unicorn_init.sh", "#{shared_path}/config/unicorn_init.sh"
      upload! "config/unicorn.rb", "#{shared_path}/config/unicorn.rb"

      sudo "ln -nfs #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      sudo "ln -nfs #{shared_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
      puts "Ahora editá la configuración de la base de datos en #{shared_path}."
    end
  end
end