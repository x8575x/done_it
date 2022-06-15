class Admin::HomesController < ApplicationController
  layout 'admin/application'

  def top
  end

  def tags
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
