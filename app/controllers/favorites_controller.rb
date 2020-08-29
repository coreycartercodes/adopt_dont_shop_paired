class FavoritesController < ApplicationController

  def index
    @favorite_pets = favorites.contents.map do |favorite|
      new_fav = Pet.find(favorite)
    end
  end

  def update
    @pet = Pet.find(params[:id])
    pet_id_str = @pet.id.to_s
    session[:favorites] ||= Array.new
    session[:favorites] << pet_id_str
    flash[:notice] = "#{@pet.name} added to favorites"
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    @pet = Pet.find(params[:id])
    session[:favorites].delete(@pet.id.to_s)
    flash[:success] = "#{@pet.name} has been removed from your favorites"
    redirect_to "/pets/#{@pet.id}"
  end
end
