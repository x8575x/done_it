class Admin::HomesController < ApplicationController
  layout 'admin/application'

  def top
    @difficulty = Difficulty.new
    @difficulties = Difficulty.all
    @long = Long.new
    @longs = Long.all
  end

end
