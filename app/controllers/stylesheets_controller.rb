require 'less'
class StylesheetsController < ApplicationController

  def new
    @stylesheet = Stylesheet.new
  end

  def create
    @stylesheet = Stylesheet.new(stylesheet_params)

    timestamp = Time.now.to_i
    filename = "custom_css_#{timestamp}.css"

    CompilerJob.delay.compile(@stylesheet, filename)

    url = request.base_url + '/' + filename
    flash[:url] = url
    redirect_to action: :new
  end

  def stylesheet_params
    params.require(:stylesheet).permit(:link_color)
  end
end
