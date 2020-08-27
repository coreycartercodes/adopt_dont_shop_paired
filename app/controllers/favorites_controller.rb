class FavoritesController < ApplicationController

  def update
    @pet = Pet.find(params[:id])
    pet_id_str = @pet.id.to_s
    session[:favorites] ||= Array.new
    session[:favorites] << pet_id_str
    flash[:notice] = "#{@pet.name} added to favorites"
    redirect_to "/pets/#{@pet.id}"
  end
end
