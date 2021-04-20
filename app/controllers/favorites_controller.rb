class FavoritesController < ApplicationController

  def index
    @favorite = Favorite.all.order(created_at: :desc)
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path
  end

end
