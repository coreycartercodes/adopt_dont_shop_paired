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
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to '/shelters'
    else
      flash[:name_warning] = "Name field required" if params[:name].empty?
      flash[:address_warning] = "Address field required" if params[:address].empty?
      flash[:city_warning] = "City field required" if params[:city].empty?
      flash[:state_warning] = "State field required" if params[:state].empty?
      flash[:zip_warning] = "Zip field required" if params[:zip].empty?
      redirect_to "/shelters/new"
    end
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update({name: params[:name], address: params[:address], city: params[:city], state: params[:state],zip: params[:zip]})
    if @shelter.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:name] = "Name field required" if params[:name].empty?
      flash[:address_warning] = "Address field required" if params[:address].empty?
      flash[:city_warning] = "City field required" if params[:city].empty?
      flash[:state_warning] = "State field required" if params[:state].empty?
      flash[:zip_warning] = "Zip field required" if params[:zip].empty?
      redirect_to "/shelters/#{@shelter.id}/edit"
    end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    if shelter.pets.find{|pet| pet.adoption_status != "Adoptable"}
      flash[:delete_warning] = "This shelter has pending adoptions and cannot be deleted."
      redirect_to '/shelters'
    else
      shelter.delete_pets
      shelter.delete_reviews
      Shelter.destroy(params[:id])
      redirect_to '/shelters'
    end
  end


end
