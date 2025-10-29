class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  # GET /estates or /estates.json
  def index
    @estates = Estate.all.order(created_at: :desc)
  end

  # GET /estates/1 or /estates/1.json
  def show
    redirect_to estates_path
  end

  # GET /estates/new
  def new
    @estate = Estate.new
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates or /estates.json
  def create
    @estate = Estate.new(estate_params)

    respond_to do |format|
      if @estate.save
        format.html { redirect_to @estate, notice: "Estate was successfully created." }
        format.json { render :show, status: :created, location: @estate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estates/1 or /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to @estate, notice: "Estate was successfully updated." }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1 or /estates/1.json
  def destroy
    @estate.destroy!

    respond_to do |format|
      format.html { redirect_to estates_path, status: :see_other, notice: "Estate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def estate_params
      params.fetch(:estate, {}).permit(:role_id, :value, :custom_timestamp)
    end
end
