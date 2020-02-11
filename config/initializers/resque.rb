rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'
config_file = rails_root + '/config/redis.yml'

resque_config = YAML::load(ERB.new(IO.read(config_file)).result)
Resque.redis = resque_config[rails_env]

