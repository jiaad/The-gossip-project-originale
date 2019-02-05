class HomePageController < ApplicationController
  def index
    redirect_to "/gossip"
  end
end
