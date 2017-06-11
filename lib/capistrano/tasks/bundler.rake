namespace :bundler do

  task :install do
    on roles fetch(:bundle_roles) do
      within release_path do
        execute :bundle,
          "#{fetch(:bundle_flags)}",
          "--gemfile #{fetch(:bundle_gemfile)}",
          "--binstubs #{fetch(:bundle_binstubs)}",
          "--without #{fetch(:bundle_without)}"
      end
    end
  end

  before 'deploy:updated', 'bundler:install'
end

namespace :load do
  task :defaults do
    set :bundle_gemfile, -> { release_path.join('Gemfile') }
    set :bundle_flags, '--quiet'
    set :bundle_without, %w{development test}.join(' ')
    set :bundle_binstubs, -> { shared_path.join('bin') }
    set :bundle_roles, :all
  end
end
