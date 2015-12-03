InstanceRoute.get_route.config do
  get "/index", :to => "custom#index"
  get "/show", :to => "custom#show"
end