class TravelDestinationsController < ApplicationController 

    #index route for all destinations
    get '/travel_destinations' do
        @travel_destinations = TravelDestination.all #load all destinations / using instance variable w @ to access outside the method 
        erb :'/travel_destinations/index'
      end
    
    #get /new to create new destinations
    get '/travel_destinations/new' do 
        erb :'travel_destinations/new'
    end 

    #post request to create new destination
    post '/travel_destinations' do
        #create a new destination and save 
        # and user is logged in 
        if !logged_in?
            redirect '/'
        end 
        if params[:title] != "" #only save if it is filled out
            flash[:message] = "Let's get to packing!!"
            @travel_destination = TravelDestination.create(title: params[:title], content: params[:content], user_id: current_user.id) #create new 
            redirect "/travel_destinations"
        else 
            flash[:error] = "Please try again."
            redirect '/travel_destinations/new'
        end 
    end

     #get show page 
     get '/travel_destinations/:id' do #dynamic route - : gets transfered into params
        @travel_destination = TravelDestination.find(params[:id])
        erb :"/travel_destinations/show"
    end 

    #edit page 
    get '/travel_destinations/:id/edit' do
        @travel_destination = TravelDestination.find(params[:id])
        if logged_in? #cannot edit if its not that users destination
            if authorized_to_edit?(@travel_destination) 
                erb :'/travel_destinations/edit'
            else 
                redirect "users/#{current_user.id}"
            end 
        else 
            redirect '/'
        end 
    end 

    post '/travel_destinations/:id' do 
        @travel_destination = TravelDestination.find(params[:id])
        if logged_in?
            if @travel_destination.user == current_user && params[:title] != ""
                @travel_destination.update(title: params[:title], content: params[:content]) #update info 
                flash[:messgae] = "Destination was updated!"
                redirect "/travel_destinations/#{@travel_destination.id}" #redirect to show page 
            else 
                redirect "users/#{current_user.id}"
            end 
        else 
            redirect '/'
        end 
    end 

    delete '/travel_destinations/:id' do 
        @travel_destination = TravelDestination.find(params[:id])
        if authorized_to_edit?(@travel_destination)
            @travel_destination.destroy
            flash[:message] = "Destination was deleted!"
            redirect "/travel_destinations"
        else 
            redirect "/travel_destinations"
        end 
    end 
end 
