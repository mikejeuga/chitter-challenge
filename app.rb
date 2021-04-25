require "sinatra"
require "sinatra/reloader"
require "./lib/peep"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
	   erb(:home)
  end
  
	 get "/feed" do
		  @peeps = Peep.all
		  erb(:feed)
	 end

	 post "/feed/new" do
		Peep.create(message: params[:message])
		redirect "/feed"
	 end

  run! if app_file == $0
end
