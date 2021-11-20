class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @province = Province.find(params[:user][:province_id])
      @user = @province.users.create(user_params)

      if @user.save
        redirect_to @user
      else
        render :new
      end
    end

    private
      def user_params
        params.require(:user).permit(:username, :password, :street_address, :province_id)
      end
end
