class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  
  def create
    
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: rand(40..48))
    if @gossip.save#(validate: false)
      redirect_to "/"
      flash[:success] = "ah we t trop fort"
      return
    else
      puts "="*90
      puts @gossip.errors.full_messages
      puts "="*90
      render :new
    end
  end

end
