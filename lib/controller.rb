require_relative "gossip"

class ApplicationController < Sinatra::Base
  get "/" do
    erb :index, locals: {gossips: Gossip.all}
  end
  get "/gossips/new/" do
    erb :new_gossip
  end
  post "/gossips/new/" do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  get "/gossips/:id/" do
    erb :show, locals: {gossip_n: Gossip.find(params['id'].to_i)}
  end
  get "/gossips/:id/edit/" do
    erb :edit
  end
  post "/gossips/:id/edit/" do
    Gossip.update(params["gossip_new_author"], params["gossip_new_content"], params["id"].to_i)
    redirect "/"
  end
end