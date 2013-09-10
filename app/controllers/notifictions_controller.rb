class NotifictionsController < ApplicationController
  before_action :set_notifiction, only: [:show, :edit, :update, :destroy]

  # GET /notifictions
  # GET /notifictions.json
  def index
    @notifictions = Notifiction.all
  end

  # GET /notifictions/1
  # GET /notifictions/1.json
  def show
  end

  # GET /notifictions/new
  def new
    @notifiction = Notifiction.new
  end

  # GET /notifictions/1/edit
  def edit
  end

  # POST /notifictions
  # POST /notifictions.json
  def create
    @notifiction = Notifiction.new(notifiction_params)

    respond_to do |format|
      if @notifiction.save
        format.html { redirect_to @notifiction, notice: 'Notifiction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notifiction }
      else
        format.html { render action: 'new' }
        format.json { render json: @notifiction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifictions/1
  # PATCH/PUT /notifictions/1.json
  def update
    respond_to do |format|
      if @notifiction.update(notifiction_params)
        format.html { redirect_to @notifiction, notice: 'Notifiction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notifiction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifictions/1
  # DELETE /notifictions/1.json
  def destroy
    @notifiction.destroy
    respond_to do |format|
      format.html { redirect_to notifictions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notifiction
      @notifiction = Notifiction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notifiction_params
      params.require(:notifiction).permit(:user_id, :msg, :unread, :sender)
    end
end
