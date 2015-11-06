class ShellyUsersController < ApplicationController
  before_action :set_shelly_user, only: [:show, :edit, :update, :destroy]	

  # GET /shelly_users
  # GET /shelly_users.json
  def index
    @shelly_users = ShellyUser.all
  end

  # GET /shelly_users/1
  # GET /shelly_users/1.json
  def show
	end

  # GET /shelly_users/new
  def new
    @shelly_user = ShellyUser.new
  end

  # GET /shelly_users/1/edit
  def edit
  end

  # POST /shelly_users
  # POST /shelly_users.json
  def create
    @shelly_user = ShellyUser.new(shelly_user_params)

    respond_to do |format|
      if @shelly_user.safely.save
        format.html { redirect_to @shelly_user, notice: 'Shelly user was successfully created.' }
        format.json { render :show, status: :created, location: @shelly_user }
      else
        format.html { render :new }
        format.json { render json: @shelly_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelly_users/1
  # PATCH/PUT /shelly_users/1.json
  def update
    respond_to do |format|
      if @shelly_user.update(shelly_user_params)
        format.html { redirect_to @shelly_user, notice: 'Shelly user was successfully updated.' }
        format.json { render :show, status: :ok, location: @shelly_user }
      else
        format.html { render :edit }
        format.json { render json: @shelly_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelly_users/1
  # DELETE /shelly_users/1.json
  def destroy
    @shelly_user.destroy
    respond_to do |format|
      format.html { redirect_to shelly_users_url, notice: 'Shelly user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelly_user
      @shelly_user = ShellyUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelly_user_params
      params.require(:shelly_user).permit(:first_name, :last_name, :email, :description, :password, :password_confirmation, :username)
    end
end
