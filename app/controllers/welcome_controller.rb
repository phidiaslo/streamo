class WelcomeController < ApplicationController
  add_breadcrumb "Anibeam", :root_path
  
  def index
  	@series = Series.all.order("created_at DESC").limit(12)
  	@episodes = Episode.all.order("created_at DESC").limit(12)
    
    @ongoing = Series.where(status: "Ongoing")
    @OngoingEpisodes = @episodes.where(:series_id => @ongoing).limit(12)
  end
  
  def feed
    @episodes = Episode.all.order("created_at DESC")
    
    @ongoing = Series.where(status: "Ongoing")
    @OngoingEpisodes = @episodes.where(:series_id => @ongoing).page(params[:page]).per(1)
   
    add_breadcrumb "Recent Ongoing Episodes"
  end

  def seriesfeed
    @series = Series.all.order("created_at DESC")
    add_breadcrumb "Recently Added"
  end

end