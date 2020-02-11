# Resque tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment
task "resque:preload" => :environment

namespace :resque do
  task :setup_schedule => :setup do
    require 'ostruct'
    require 'resque-scheduler'

    rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../../'
    schedule_file = rails_root + 'config/schedule.yml'
    p schedule_file
    Resque.schedule = YAML.load_file(schedule_file)
  end

  task :scheduler => :setup_schedule
end
