class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def show_pets
    @shelter = Shelter.find(params[:id])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    pet = @shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{@shelter.id}/pets/"
  end

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :adoption_status, :shelter_id)
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({image: params[:image], name: params[:name], age: params[:age], sex: params[:sex]})
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  #
  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets/"
  end


end
