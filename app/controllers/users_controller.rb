class UsersController < ApplicationController
    #get, post, etc are Sinatra methods
    #show the login page 
    get '/login' do 
        erb :login #render the login page
    end 
    
    #recieve the login form, find user, log user in 
    post '/login' do
        #my params look like this (email: "me@gmail.com", password: "password")
        #find the user 
        @user = User.find_by(email: params[:email])
        #authnticate the user - verify user is that user 
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id #logging user in
            #redirect to the users show page 
            puts session 
            redirect "/users/#{@user.id}"
        else 
            #says invalid 
            flash[:error] = "Invalid, please try again"
            #redirect to login page
            redirect '/login' 
        end 
       
        
    end 

    #render the signup form
    get '/signup' do 
        erb :signup 
    end 

    post '/users' do 
        #create new user 
        #my param looks like this: {"name"=>"Jenae Christensen",
 #"email"=>"729jenae.christensen@gmail.com",
 #"password"=>"dontforget"}
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id #logging the user in
            flash[:message] = "Account created!"
            redirect "users/#{@user.id}"
        else 
            flash[:error] = "Creation failed, please try again."
            redirect '/signup'
        end 
    end 

    #user show route/page
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end 

    get '/logout' do 
        session.clear 
        redirect '/'
    end 
end 
