class HomeController < ApplicationController
  def index
    
  end
  def write
    redirect_to "/list"
    @title = params[:title]
    @content = params[:content]
    
  end
  def list
    
  end
end
