class ScenesController < ApplicationController

  def index
    @dream = Dream.find(params[:dream_id])
    @scenes = @dream.scenes
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def scenes_params
    params.require(:scene).permit(:image_url, :content)
  end

end
