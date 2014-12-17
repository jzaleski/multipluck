namespace :db do
  %w[create drop migrate rollback version].each do |task_name|
    desc "Run db:#{task_name} in the dummy application"
    task task_name.to_sym do
      run_rake_task_in_dummy("db:#{task_name}")
    end
  end

  namespace :schema do
    desc 'Run db:schema:load in the dummy application'
    task :load do
      run_rake_task_in_dummy('db:schema:load')
    end
  end

  namespace :test do
    desc 'Run db:test:prepare in the dummy-app'
    task :prepare do
      run_rake_task_in_dummy('db:test:prepare')
    end
  end
end
