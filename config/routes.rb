InstanceRoute.get_route.config do
  get "/", :to => "main#index"
  get "/index", :to => "custom#index"
  get "/show", :to => "custom#show"
end