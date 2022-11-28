class ProfilsController < ApplicationController

    def update
        
        puts "-" * 60
        testuser = User.find(params[:id])

        puts "-" * 60
        puts testuser
        
        @post = current_user.update('first_name' => params[:first_name],
            'last_name' => params[:last_name], 
            'city' => params[:city],
            'address' => params[:address],
            'country' => params[:country],
            'zip_code' => params[:zip_code])
      
    end

    def create
        puts "-" * 60
        puts "step 1" * 60
    
        
        @post = User.update('first_name' => params[:first_name],
            'last_name' => params[:last_name], 
            'city' => params[:city],
            'address' => params[:address],
            'country' => params[:country],
            'zip_code' => params[:zip_code])
     
            redirect_back(fallback_location: root_path)
      
    end
end
