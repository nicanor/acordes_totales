namespace :load do
  task all: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['load:users'].invoke
    Rake::Task['load:pages'].invoke
    Rake::Task['load:artists'].invoke
    Rake::Task['load:tabs'].invoke
  end
end