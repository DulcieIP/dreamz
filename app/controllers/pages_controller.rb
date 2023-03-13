class PagesController < ApplicationController
  def home
  end

  def dreamboard
    # Dream.where(user: current_user) == current_user.dreams
    if params[:user_id].present?
      @dreams = User.find(params[:user_id]).dreams.order(created_at: :desc)
    else
      @dreams = current_user.dreams.order(created_at: :desc)
    end
  end

  def dreamfeed
    @dreams = Dream.order(created_at: :desc)
  end
end
