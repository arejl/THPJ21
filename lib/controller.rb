require_relative "gossip"
require_relative 'comment'

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
    erb :show, locals: {gossip_n: Gossip.find(params['id'].to_i), id: params['id'], comments: Comment.all}
  end
  post "/gossips/:id/" do
    Comment.new(params["comment_author"], params["comment_content"], params["id"]).save
    redirect "/gossips/:id/"
  end
  get "/gossips/:id/edit/" do
    erb :edit, locals: {id: params['id']}
  end
  post "/gossips/:id/edit/" do
    Gossip.update(params["gossip_new_author"], params["gossip_new_content"], params["id"].to_i)
    redirect "/"
  end
end