class WelcomePageController < ApplicationController
  def welcome
    puts '=' * 90
    puts params[:first_name]
    puts "=" * 90
    #@prenom_bienvenue = params[:first_name]
  end
end
