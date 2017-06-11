namespace :nginx do

  desc 'Reload & restart nginx'
  task :restart do
    on roles(:app), in: :sequence do
      sudo "/etc/init.d/nginx reload"
      sudo "/etc/init.d/nginx restart"
    end
  end

end