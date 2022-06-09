class Admin::HomesController < ApplicationController
  layout 'admin/application'

  def top
    @difficulty = Difficulty.new
    @difficulties = Difficulty.all
    @long = Long.new
    @longs = Long.all
    @type = Type.new
    @types = Type.all
    @mystery = Mystery.new
    @mysteries = Mystery.all
    @tag = Tag.new
    @tags = Tag.all
  end

end
