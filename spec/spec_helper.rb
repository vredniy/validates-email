$LOAD_PATH << '.' unless $LOAD_PATH.include?('.')
require 'logger'

Bundler.require

require File.expand_path('../../lib/validates-email', __FILE__)

db_name = ENV['DB'] || 'sqlite3'
database_yml = File.expand_path('../database.yml', __FILE__)

if File.exists? database_yml
  active_record_configuration = YAML.load_file database_yml

  ActiveRecord::Base.configurations = active_record_configuration
  config = ActiveRecord::Base.configurations[db_name]

  begin
    ActiveRecord::Base.establish_connection db_name
    ActiveRecord::Base.connection
  end

  logger = ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), 'debug.log'))
  ActiveRecord::Base.default_timezone = :utc

  begin
    old_logger_level, logger.level = logger.level, ::Logger::ERROR
    ActiveRecord::Migration.verbose = false

    load(File.dirname(__FILE__) + '/schema.rb')
    load(File.dirname(__FILE__) + '/models.rb')
  ensure
    logger.level = old_logger_level
  end
else
  raise "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.sample"
end



RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
