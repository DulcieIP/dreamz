require 'open-uri'
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
    redirect_to dreamboard_path
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user

    if @dream.save
      openai_request
      redirect_to dream_scenes_path(@dream)
    else
      render :new, status: :unprocessable_entity, alert: "Please try again"
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  private

  def openai_request
    client = OpenAI::Client.new
    prompt = @dream.content
    request = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: "If you can, split this text in paragraph without change or add any word : #{prompt} ", }],
          temperature: 0.7
      }
    )
    chatgpt_response = request.dig("choices", 0, "message", "content")
    paragraphs = chatgpt_response.strip.split("\n\n")
    paragraphs.each do |paragraph|
      response = client.images.generate(parameters: { prompt: "#{paragraph} ,artstation, hd, dramatic lighting, detailed",
                                      size: "256x256",
                                      n: 1 })
      image_url = response.dig("data", 0, "url")
      scene = Scene.new(content: paragraph, dream: @dream, image_url: image_url)
      file = URI.open(image_url)
      scene.image.attach(io: file, filename: "#{Scene.last.id + 1}.png", content_type: "image/png")
      scene.save!
      # Scene.create!(content: paragraph, dream: @dream, image_url: image_url)


    end
  end

  def dream_params
    params.require(:dream).permit(:content, :character, :ambiance, :location)
  end
end
