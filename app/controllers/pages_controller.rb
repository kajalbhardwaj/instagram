class PagesController < ApplicationController

  def index
    @user = current_user
  end

  def home
    @user = current_user
  end

  def profile
    @user = current_user
  end
end
