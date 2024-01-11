class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def show
    end
    def index
        @artist=Artist.all
    end

    def new
        @artist=Artist.new
    end
    
    def create
        @artist=Artist.new(artist_params)
        if @artist.save
            flash[:notice]="Artist Successfully Registered"
            redirect_to artists_path
        else
            render :new, status: :unprocessable_entity
        end
    end    
    
    def edit

    end

    def update
        if @artist.update(artist_params)
            flash[:notice]="Artist is successfully updated"
            redirect_to artists_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end
    
    def destroy
        @music=Music.where(artist_id: @artist.id)
        @music.destroy_all
        if @artist.destroy
            flash[:notice]="Artist is Successfully Destroyed"
            redirect_to artist_path
        end

    end    

    private

    def set_artist
        @artist=Artist.find(params[:id])
    end    

    def artist_params
        params.require(:artist).permit(:name,:dob,:gender, :address, :first_release_year,:no_of_albums_released)
    end    

end