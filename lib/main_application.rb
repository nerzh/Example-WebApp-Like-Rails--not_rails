class MainApplication
  def call(env)
    route = InstanceRoute.get_route.route_for(env)
    if route
      response = route.execute(env)
      # return response.rack_response
      return response
    else
      return [404, {}, []]
    end
  end
end