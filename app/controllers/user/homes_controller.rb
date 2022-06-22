class User::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  
  def top
  end

  def about
    @tags = Tag.all
  end

end
