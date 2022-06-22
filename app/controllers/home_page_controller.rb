class HomePageController < ApplicationController
  def index
    if params[:urlValue] 
    render "extracted_info"
    end
  end

  def results
    redirect_to :controller => 'ExtractedInfoController', :url => "test"
  end
end
