class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    
    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def create
        @listing = Listing.create(listing_params)
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def listing_params
        new_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :deposit, :price, :date_of_birth, :diet)
    end
    
end