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
    @pet = @shelter.pets.new(pet_params)
    if @pet.save
      redirect_to "/shelters/#{@shelter.id}/pets/"
    else
      flash[:pet_name_warning] = "Name field required" if params[:name].empty?
      flash[:description_warning] = "Description field required" if params[:description].empty?
      flash[:age_warning] = "Age field required" if params[:age].empty?
      flash[:sex_warning] = "Sex field required" if params[:sex].empty?
      redirect_to "/shelters/#{@shelter.id}/pets/new"
    end
  end

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :adoption_status, :shelter_id)
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update({image: params[:image], name: params[:name], age: params[:age], sex: params[:sex]})
    if @pet.save
      redirect_to "/pets/#{@pet.id}"
    else
      flash[:pet_name_warning] = "Name field required" if params[:name].empty?
      flash[:description_warning] = "Description field required" if params[:description].empty?
      flash[:age_warning] = "Age field required" if params[:age].empty?
      flash[:sex_warning] = "Sex field required" if params[:sex].empty?
      redirect_to "/pets/#{@pet.id}/edit"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.adoption_status != "Adoptable"
      flash[:pet_delete_warning] = "This pet has a Pending adoption"
      redirect_to "/pets"
    else
      favorites.contents.delete(@pet.id.to_s)
      Pet.destroy(params[:id])
      redirect_to "/pets/"
    end
  end

  def approve
    @pet = Pet.find(params[:id])
    @approved_adoption = Adoption.find(params[:adoption])
    @pet.update(adoption_status: "Pending-#{@approved_adoption.id}")
    flash[:pending] = "On hold for #{@approved_adoption.name}"
    redirect_to "/pets/#{@pet.id}"
  end

  def revoke
    @pet = Pet.find(params[:id])
    @pet.update(adoption_status: "Adoptable")
    @adoption = Adoption.find(params[:adoption])
    redirect_to "/adoptions/#{@adoption.id}"
  end
end
