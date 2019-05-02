class MicropotsController < ApplicationController
  before_action :set_micropot, only: [:show, :edit, :update, :destroy]

  # GET /micropots
  # GET /micropots.json
  def index
    @micropots = Micropot.all
  end

  # GET /micropots/1
  # GET /micropots/1.json
  def show
  end

  # GET /micropots/new
  def new
    @micropot = Micropot.new
  end

  # GET /micropots/1/edit
  def edit
  end

  # POST /micropots
  # POST /micropots.json
  def create
    @micropot = Micropot.new(micropot_params)

    respond_to do |format|
      if @micropot.save
        format.html { redirect_to @micropot, notice: 'Micropot was successfully created.' }
        format.json { render :show, status: :created, location: @micropot }
      else
        format.html { render :new }
        format.json { render json: @micropot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /micropots/1
  # PATCH/PUT /micropots/1.json
  def update
    respond_to do |format|
      if @micropot.update(micropot_params)
        format.html { redirect_to @micropot, notice: 'Micropot was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropot }
      else
        format.html { render :edit }
        format.json { render json: @micropot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micropots/1
  # DELETE /micropots/1.json
  def destroy
    @micropot.destroy
    respond_to do |format|
      format.html { redirect_to micropots_url, notice: 'Micropot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropot
      @micropot = Micropot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropot_params
      params.require(:micropot).permit(:content, :user_id)
    end
end
