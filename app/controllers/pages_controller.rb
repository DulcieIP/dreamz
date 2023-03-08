class PagesController < ApplicationController
  def home
  end

  def dreamboard
    @dreams = Dream.all
  end
end
