class UserController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        restrict_access if @user.id != current_user.id 
    end

    def update
        @user = User.find(params[:id])
       
        if @user.update(user_params)
          redirect_to @user
        else
          render 'edit'
        end
    end

    def restrict_access
      redirect_to root_path
    end

    private
        def user_params
        params.require(:user).permit(:username, :image, :email, :is_admin)
        end

end
