require 'mailgun'
class HomeController < ApplicationController
  def index
    
  end
  def write
    @receiver = params[:receiver]
    @title = params[:title]
    @content = params[:content]
        
    mg_client = Mailgun::Client.new("key-4d8a9838997d3abfb6e61bb600508de1")
        
    message_params =  {
       from: 'admin@google.com',
       to:   @receiver,
       subject: @title,
       text:    @content
    }
        
    result = mg_client.send_message('sandboxfd454ce993a848c5abb0bd509d587424.mailgun.org', message_params).to_h!
        
    message_id = result['id']
    message = result['message']
    
    new_post = Post.new
    #title은 migrate의 title과 같아야함
    new_post.title = @title
    new_post.receiver = @receiver
    new_post.content = @content
    new_post.save
    
    redirect_to "/list"
  end
  def list
    @every_post = Post.all.order("id desc")
  end
end
