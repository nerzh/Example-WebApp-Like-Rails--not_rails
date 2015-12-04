InstanceRoute.get_route.config do
  get "/",         to: "main#index"
  get "/start",    to: "game#start"
  get "/restart",  to: "game#restart"
  get "/play",     to: "game#play"
  get "/guess",    to: "game#guess"
  get "/result",   to: "game#result"
  get "/hint",     to: "game#hint"
  get "/save",     to: "game#save"
  post "/create",  to: "game#create"
  get "/exit",     to: "game#exit"
end