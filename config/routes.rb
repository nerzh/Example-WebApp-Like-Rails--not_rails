InstanceRoute.get_route.config do
  get "/", :to => "main#index"
  get "/start", :to => "game#start"
  get "/play", :to => "game#play"
  get "/guess", :to => "game#guess"
end