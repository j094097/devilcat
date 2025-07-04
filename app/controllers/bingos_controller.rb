class BingosController < ApplicationController
  require "rmagick"

  def index
  end

  def random
  end

  def self_selected
    if params[:card_ids]
      @card_ids = clean_params
    else
      @card_ids = []
    end

    if @card_ids.length == 25 && params[:results]
      @results = results_params

      # @results = @results.to_enum.sort_by(&:last)

      @results = @results.to_enum.to_h.sort_by { |k| k.last.to_i }
    else
      @results = []
    end

    if @results.any? && @results.length <= 25

      images_path = "public/images"
      @file_name = "self_selected.jpg"
      file_path = images_path + "/" + @file_name

      if File.exist? file_path
        File.delete file_path 
      end

      img = Magick::Image.read("lib/sample_images/bingo.png").first

      text = Magick::Draw.new
      text.font = "public/images/simsun.ttc"
      text.pointsize = 35
      text.gravity = Magick::CenterGravity

      x_axis = [ -400, -200, -10, 180, 370 ]
      y_axis = [ -400, -200, -40, 140, 320 ]
      x = 0
      y = 0
      @results.each do |card, value|
        if card.length > 5
          text.pointsize = 20
        else
          text.pointsize = 35
        end

        text.annotate(img, 0,0,x_axis[x] ,y_axis[y], card) { |options|
          options.fill = 'gray83'
        }

        x += 1
        
        if (x==5)
          x = 0
          y += 1
        end 
      end

      self_selected = img.scale(1)
      @path = "/images/" + @file_name + "?timestamp=" + Time.now.to_time.to_i.to_s
      self_selected.write file_path
    end
  end

  def generate
    images_path = "public/images"
    @file_name = "rmagick_generated_thumb.jpg"
    file_path = images_path + "/" + @file_name

    @random_cards = Constants.get_random_card(25)

    if File.exist? file_path
      File.delete file_path 
    end

    img = Magick::Image.read("lib/sample_images/bingo.png").first

    text = Magick::Draw.new
    text.font = "public/images/simsun.ttc"
    text.pointsize = 35
    text.gravity = Magick::CenterGravity

    x_axis = [ -400, -200, -10, 180, 370 ]
    y_axis = [ -400, -200, -40, 140, 320 ]
    x = 0
    y = 0
    @random_cards.each do |card|
      if card.length > 5
        text.pointsize = 20
      else
        text.pointsize = 35
      end

      text.annotate(img, 0,0,x_axis[x] ,y_axis[y], card) { |options|
        options.fill = 'gray83'
      }

      x += 1
      
      if (x==5)
        x = 0
        y += 1
      end 
    end

    thumb = img.scale(1)
    @path = "/images/" + @file_name + "?timestamp=" + Time.now.to_time.to_i.to_s
    thumb.write file_path
  end

  private
    def clean_params
      params.require(:card_ids)
    end

    def results_params
      params.require(:results)
    end
end
