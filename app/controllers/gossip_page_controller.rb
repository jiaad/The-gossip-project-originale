class GossipPageController < ApplicationController
  def show_gossip
    @gossip = Gossip.all
    @user = User.all
   # puts @gossip = Gossip.find(params[:id])
  end
  
  def gossip_by_id
    i = params[:gossip_id].to_i
    @gossip_id = Gossip.find(i)
  end

  
end
