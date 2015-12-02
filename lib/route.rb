require File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'base_controller')

class Route
  attr_accessor :klass_name, :path, :instance_method
  def initialize route_hash
    @path            = route_hash[:path]
    @klass_name      = route_hash[:klass]
    @instance_method = route_hash[:method]
    handle_requires
  end

  def klass
    Module.const_get(klass_name)
  end

  def execute(env)
    klass.new(env).send(instance_method.to_sym)
  end

  def handle_requires
    require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', "#{klass_name.downcase}" )
  end
end