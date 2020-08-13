require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "travelbug"
    register Sinatra::Flash
  end  

  get "/" do
    if logged_in? 
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end


  helpers do 

    def logged_in? #put ? to return a boolean - true or false 
      #true if user is logged in, else, false
      !!current_user # !!(double bang) 
    end 

    def current_user #return current user if there is one
      @current_user ||= User.find_by(id: session[:user_id])
    end 

    def authorized_to_edit?(travel_destination)
      travel_destination.user == current_user
    end  
  end 

end
