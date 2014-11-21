class SeriesController < ApplicationController
  include SeriesHelper
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Anibeam", :root_path

  # GET /series
  # GET /series.json
  def index
    alphabet
    @series = Series.all.page(params[:page]).per(20)
    @recent = Series.all.order("date_aired DESC").limit(50)
    @ongoing = Series.where(status: "Ongoing")
    @complete = Series.where(status: "Complete")
    @popular = Series.all.order("view_count DESC").limit(50)
    
    add_breadcrumb "Mecha Anime", :series_index_path
  end

  def search
    index
    render :index
  end

  # GET /series/1 
  # GET /series/1.json
  def show
    @episodes = Episode.where(:series_id => @series).order("created_at DESC")
    
    add_breadcrumb "Mecha Anime", :series_index_path
    add_breadcrumb "#{@series.name}", :series_path
  end

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(series_params)
   
    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def alphabet
    @a = Series.find_by_first_letter('a')
    @b = Series.find_by_first_letter('b')
    @c = Series.find_by_first_letter('c')
    @d = Series.find_by_first_letter('d')
    @e = Series.find_by_first_letter('e')
    @f = Series.find_by_first_letter('f')
    @g = Series.find_by_first_letter('g')
    @h = Series.find_by_first_letter('h')
    @i = Series.find_by_first_letter('i')
    @j = Series.find_by_first_letter('j')
    @k = Series.find_by_first_letter('k')
    @l = Series.find_by_first_letter('l')
    @m = Series.find_by_first_letter('m')
    @n = Series.find_by_first_letter('n')
    @o = Series.find_by_first_letter('o')
    @p = Series.find_by_first_letter('p')
    @q = Series.find_by_first_letter('q')
    @r = Series.find_by_first_letter('r')
    @s = Series.find_by_first_letter('s')
    @t = Series.find_by_first_letter('t')
    @u = Series.find_by_first_letter('u')
    @v = Series.find_by_first_letter('v')
    @w = Series.find_by_first_letter('w')
    @x = Series.find_by_first_letter('x')
    @y = Series.find_by_first_letter('y')
    @z = Series.find_by_first_letter('z')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name, :date_aired, :synopsis, :status, :cover)
    end
end
