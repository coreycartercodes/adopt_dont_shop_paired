class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({name: params[:name], address: params[:address], city: params[:city], state: params[:state],zip: params[:zip]})
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelter = Shelter.find(params[:id])
    if shelter.pets.find{|pet| pet.adoption_status != "Adoptable"}
      flash[:delete_warning] = "This shelter has pending adoptions and cannot be deleted."
      redirect_to '/shelters'
    else
    shelter.delete_pets
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end
  end


end
