require File.join(File.dirname(__FILE__), 'settings_route')

class BaseRoutes
  attr_reader :get_route

  def initialize
    @get_route = SettingsRoute.new
  end
end