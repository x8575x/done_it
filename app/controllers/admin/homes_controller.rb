class Admin::HomesController < ApplicationController
  layout 'admin/application'
  
  def top
    @difficulty = Difficulty.new
    @difficulties = Difficulty.all
  end
  
end
