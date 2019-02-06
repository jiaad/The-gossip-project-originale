class CityController < ApplicationController
  def show
    i = params[:id].to_i
    @city = City.find(i)
  end
end
