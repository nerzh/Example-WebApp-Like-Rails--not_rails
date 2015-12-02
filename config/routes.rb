RackerApplication.router.config do
  get "/index", :to => "custom#index"
  # get /.*/, :to => "custom#show"
end