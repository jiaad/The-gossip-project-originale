class HomePageController < ApplicationController
  def index
    redirect_to "/gossips"
  end
end
