class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize!, only: [:edit, :update, :destroy]
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
    # @listings = Listing.where.not(longitude: nil, latitude: nil)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @comment = Comment.new
  end

  # GET /listings/new
  def new
    @listings     = current_user.listings
    @listing      = Listing.new
    @listing.user = current_user
    @features     = Feature.all
  end

  # GET /listings/1/edit
  def edit

  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |format|
      if @listing.save
        $client.update("Hi #{@listing.description}#{@listing.address} has been listed")
        format.html { redirect_to new_listing_path, notice: 'Listing was successfully created.' }
        format.js { render :create_success }
      else
        format.html { render :new, notice: "Error" }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to new_listing_path, notice: 'Listing was successfully destroyed.' }
      format.js { render :create_failure }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit([:description, :address, :price, :postal, :city, :country, :image, :user_id, {feature_ids:[]}])
    end

    def authorize!
      redirect_to @listing, alert: "Access Denied" unless can? :manage, @listing
    end
end
