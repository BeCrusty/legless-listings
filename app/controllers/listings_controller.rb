class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :set_breeds_and_sexes, only: [:new, :edit]
    
    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.create(listing_params)

        if @listing.errors.any?
            set_breeds_and_sexes
            render "new"
        else
            redirect_to listings_path
        end
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

    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def listing_params
        new_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :deposit, :price, :date_of_birth, :diet, :picture)
    end
    
end