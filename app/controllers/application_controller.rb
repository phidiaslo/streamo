class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  
  before_filter :set_global_search_variable

  def set_global_search_variable
    @search = Series.search(params[:q])
  end
end
