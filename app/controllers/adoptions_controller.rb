class AdoptionsController < ApplicationController

  def new
    @favorite_pets = favorites.contents.map do |favorite|
      new_fav = Pet.find(favorite)
    end
  end

  def create
    @adoption = Adoption.new(adoptions_params)
    params[:apply_status].each do |pet_id, value|
      if value == "1"
        @pet = Pet.find(pet_id)
        @adoption.pets << @pet
      end
    end
    if @adoption.save
      @adoption.pets.each do |pet|
        session[:favorites].delete(pet.id.to_s)
      end
      flash[:save_alert] = "Application Submitted Successfully!"
      redirect_to '/favorites'
    else
      flash[:warning] = "All fields required to continue!"
      redirect_to '/adoptions/new'
    end
  end

  def adoptions_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description, :pets)
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

end
