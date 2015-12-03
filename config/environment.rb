require 'active_record'
require 'yaml'
# require 'sqlite3'

dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'database.yml')))

# byebug
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(dbconfig['development'])