class StaticPagesController < ApplicationController
  def home
    if !signed_in?
      redirect_to '/sessions/new'
    else
      redirect_to current_user
    end
  end

  def show
  end
end
