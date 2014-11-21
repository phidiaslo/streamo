class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
 
  add_breadcrumb "Anibeam", :root_path
  add_breadcrumb "Mecha Anime", :series_index_path
  
  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all.order("created_at DESC")
    @series = Series.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode.increment!(:view_count)
    @series = Series.find_by(:name => "#{@episode.series.name}")
    @episodes = Episode.where(:series_id => @series)

    @total_count = @episodes.sum(:view_count)
    @series.view_count = @total_count
    @series.save

    @previous = @episodes.where("id < ?", @episode).order(:id).first
    @next = @episodes.where("id > ?", @episode).order(:id).first

    add_breadcrumb "#{@episode.series.name}", series_path(@episode.series.slug)
    add_breadcrumb "#{@episode.name}", episode_path
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
    #@series = Series.find(params[:series_id]) #Trial
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)
    #@series = Series.find(params[:series_id]) #Trial

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:name, :video_code, :slug, :series_id, :sub_status)
    end
end
