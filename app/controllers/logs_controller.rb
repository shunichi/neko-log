class LogsController < ApplicationController
  before_action :set_cat
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = @cat.logs.order(created_at: :desc)
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = @cat.logs.build
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = @cat.logs.build(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to cat_logs_path(@cat), notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: [@cat, @log] }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to [@cat, @log], notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: [@cat, @log] }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to cat_logs_url(@cat), notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_cat
    @cat = Cat.find(params[:cat_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = @cat.logs.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def log_params
    params.require(:log).permit(:weight)
  end
end
