class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end

  def filtered_scene
    @dream = Dream.find(params[:id])
    @rejected_scenes = @dream.scenes.reject { |scene| params[:dream][:scenes].include?(scene.id.to_s) }
    @rejected_scenes.each do |scene|
      scene.destroy
    end
    raise
  end

end
