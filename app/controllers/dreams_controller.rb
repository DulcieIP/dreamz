class DreamsController < ApplicationController
  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    if @dream.save
      redirect_to dream_scenes_path
    else
      render :new, status: :unprocessable_entity, alert: "Please try again"
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:content, :character, :ambiance, :location)
  end
end
