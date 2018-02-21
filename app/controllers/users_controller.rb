class UsersController < ApplicationController

	before_action :authenticate_user!
	layout 'main'
 
	def new	
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      flash[:notice] = 'Usuario creado correctamente'
	      redirect_to users_path
	    else
	      render :new
	    end
  	end

	def edit
		
		@user = User.find(params[:id])
		
	end

	def update
		if params[:user][:password].blank?
		  	params[:user].delete(:password)
		  	params[:user].delete(:password_confirmation)
		end
		@user = User.find params[:id]
		@user.update user_params
		redirect_to users_path
	end

	def show
		@user = User.find params[:id]
	end

	def index
		@users = User.where(status: 'activo')
		@usersD = User.where(status: 'inactivo')
	end

	def destroy
		@user = User.find params[:id]
		@user.update({status: 'inactivo'})
		redirect_to users_path
	end




	private

	def user_params
		params.require(:user).permit(:email, :name, :lastName, :celPhone, :address, :status, :password)

	end

	def delete_params
		
		params.require(:user).permit(:status)
	end



end
