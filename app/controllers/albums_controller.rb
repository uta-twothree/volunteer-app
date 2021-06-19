class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :content, :area_id, :theme_id).merge(user_id: current_user.id)
  end
end
