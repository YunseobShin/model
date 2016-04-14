class HomeController < ApplicationController
  def index
    
  end
  def write
    new_post = Post.new
    #,title은 migrate의 title과 같아야함
    new_post.title = params[:title]
    new_post.content = params[:content]
    new_post.save
    
    redirect_to "/list"
  end
  def list
    @every_post = Post.all.order("id desc")
  end
end
