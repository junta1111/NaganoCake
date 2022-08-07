class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    genre = Genre.new
    genre.save
    redirect_to 'index'
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to genre_path(genre.id)
  end
  
  private
  def genre_params
    params.require(:genre).permit(:genre)
  end
end
