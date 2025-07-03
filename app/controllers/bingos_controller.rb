class BingosController < ApplicationController
  require "rmagick"

  def index
  end

  def random
  end

  def generate
    images_path = "public/images"
    @file_name = "rmagick_generated_thumb.jpg"
    file_path = images_path + "/" + @file_name

    @random_cards = Constants.get_random_card(25)

    File.delete file_path if File.exist? file_path

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

    print @file_name
    thumb = img.scale(1)
    @path = "/images/" + @file_name
    thumb.write file_path
  end
end
