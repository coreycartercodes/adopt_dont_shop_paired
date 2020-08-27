class ApplicationController < ActionController::Base
  helper_method(:favorites)

  def favorites
    Favorite.new(session[:favorites])
  end
end
