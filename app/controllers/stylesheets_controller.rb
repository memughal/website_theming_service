require 'less'
class StylesheetsController < ApplicationController

  def new
    @stylesheet = Stylesheet.new
  end

  def create
    @stylesheet = Stylesheet.new(stylesheet_params)

    if @stylesheet.valid?
      timestamp = Time.now.to_i
      filename = "custom_css_#{timestamp}.css"

      CompilerJob.delay.compile(@stylesheet, filename)

      url = request.base_url + '/' + filename
      flash[:url] = url
      redirect_to action: :new
    else
      render :new
    end
  end

  def stylesheet_params
    params.require(:stylesheet).permit(:text_color, :link_color, :font_family)
  end
end
