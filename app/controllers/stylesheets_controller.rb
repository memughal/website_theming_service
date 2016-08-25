require 'less'
class StylesheetsController < ApplicationController
  def new

    timestamp = Time.now.to_i
    filename = "custom_css_#{timestamp}.css"

    CompilerJob.delay.compile(filename)

    url = request.base_url + '/' + filename
    flash[:url] = url
  end
end
