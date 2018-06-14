class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        #render 'new'
        #debugger
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome on board!"
            redirect_to user_path(user)
            
        else
            flash.now[:danger] = "Something went wrong. Try it again."
            render 'new'
         
        end
    end
    
    
    def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
    end
  
    
end