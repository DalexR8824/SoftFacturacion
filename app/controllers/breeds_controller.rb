class BreedsController < ApplicationController

	layout 'main'

	def index
		@breeds = Breed.all
	end

	def new
		@breed = Breed.new
		
	end

	def create
		@breed = Breed.new(breed_params)
		if @breed.save
			redirect_to breeds_path
		else
			render 'new'
		end
		
	end

	def edit
		@breed = Breed.find(params[:id])
		
	end

	def update
		@breed = Breed.find(params[:id])
		if @breed.update(breed_params)
			redirect_to breeds_path
		else
			render 'edit'
		end
		
	end

	def destroy
		@breed = Breed.find(params[:id])
		if @breed.destroy
			redirect_to breeds_path
		else
			render 'edit'
		end
		
	end





	private

	def breed_params

		params.require(:breed).permit(:code, :name)
		
	end


end
