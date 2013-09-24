class Admin::DictionariesController < Admin::ApplicationController
  before_action :set_admin_dictionary, only: [:show, :edit, :update, :destroy]

  # GET /admin/dictionaries
  # GET /admin/dictionaries.json
  def index
    @admin_dictionaries = Admin::Dictionary.all
  end

  # GET /admin/dictionaries/1
  # GET /admin/dictionaries/1.json
  def show
  end

  # GET /admin/dictionaries/new
  def new
    @admin_dictionary = Admin::Dictionary.new
  end

  # GET /admin/dictionaries/1/edit
  def edit
  end

  # POST /admin/dictionaries
  # POST /admin/dictionaries.json
  def create
    @admin_dictionary = Admin::Dictionary.new(admin_dictionary_params)

    respond_to do |format|
      if @admin_dictionary.save
        format.html { redirect_to @admin_dictionary, notice: 'Dictionary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_dictionary }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/dictionaries/1
  # PATCH/PUT /admin/dictionaries/1.json
  def update
    respond_to do |format|
      if @admin_dictionary.update(admin_dictionary_params)
        format.html { redirect_to @admin_dictionary, notice: 'Dictionary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/dictionaries/1
  # DELETE /admin/dictionaries/1.json
  def destroy
    @admin_dictionary.destroy
    respond_to do |format|
      format.html { redirect_to admin_dictionaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_dictionary
      @admin_dictionary = Admin::Dictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_dictionary_params
      params.require(:admin_dictionary).permit(:name, :key, :value)
    end
end
