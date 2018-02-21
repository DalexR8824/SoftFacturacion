class PetsController < ApplicationController

	layout 'main'

	def index
		@pets = Pet.all
		
	end

	def new
		@pet = Pet.new
		@razas = Breed.all
		
	end

	def create
		@raza = Breed.all
		@pet = Pet.new(pets_params)

 

		if @pet.save
			redirect_to pets_path 
		else
			render 'new'
		end
		
	end

	def edit
		@pet = Pet.find(params[:id])
		
	end

	def update
		@pet = Pet.find(params[:id])
		if @pet.update(pets_params)
			redirect_to pets_path 
		else
			render 'edit'
		end
		
	end


	private

	def pets_params

		params.require(:pet).permit(:ownerPet, :namePet, :specie, :sex, :birthdate, :weight, :breed_id)
		
	end

end
