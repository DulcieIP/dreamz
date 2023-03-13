class PagesController < ApplicationController
  def home
  end

  def dreamboard
    @dreams = Dream.where(user: current_user).order(created_at: :desc)
  end

  def dreamfeed
    @dreams = Dream.order(created_at: :desc)
  end
end
