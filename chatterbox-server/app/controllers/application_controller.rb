class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add routes

  get "/messages" do
    messages = Message.all.order(created_at: :ASC)
    messages.to_json
  end

  #post
  post "/messages" do
    message = Message.create(
      body: params[:body],
      username: params[:username],
    )
    message.to_json
    #update
  end

  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(
      body: params[:body],
    )
    message.to_json
  end
  #delete

  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
