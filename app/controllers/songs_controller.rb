class SongsController < ApplicationController
	def index
		
	end

	def new
		@song = Song.new
	end

	def show
		@song = Song.find(params[:id])
		@song_genre = Genre.find_by(id: @song.genre_id)
		@song_artist = Artist.find_by(id: @song.artist_id)
	end

	def edit
		@song = Song.find(params[:id])
	end

	def create
		@song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))


		redirect_to song_path(@song)
	end

	def update
		@song = Song.find(params[:id])
		@song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
		redirect_to song_path(@song)
	end
end
