class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
   
    def new
     @user = User.new
    end
    
      def show
        @user = User.find(params[:id])
        respond_to do |format|
          format.html { render :show }
          format.json { render json:  @user }    
        end
      end
    
      def create
        @user = User.new(user_params)
    
           if @user.save
             session[:user_id] = @user.id
             redirect_to user_path(@user)
             flash[:msg] = "Welcome to Parks-book."
           else
             render :new
           end
         end
      
    
      private 
    
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end 
    
end
