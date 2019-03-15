module SimpleApp
  
  def self.require_all(dirs)
    dirs.each do |dir|
      self.class_eval do
        begin
          require_relative '.' << dir
        rescue LoadError => ex
          p ex
        end
      end
    end
  end

  require_all(Dir["./lib/**/*.rb"])
  require_all(Dir["./app/**/*.rb"])

  dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'database.yml')))
  ActiveRecord::Base.logger = Logger.new(STDERR)
  ActiveRecord::Base.establish_connection(dbconfig['development'])
end
