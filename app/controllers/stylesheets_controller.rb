require 'less'
class StylesheetsController < ApplicationController
  def new
    timestamp = Time.now.to_i
    filename = "custom_css_#{timestamp}.css"

    user_variables = ""
    user_variables << "@link-color:#009999;"

    if !user_variables.empty?

      parser = Less::Parser.new(paths: [Rails.root.join('vendor', 'assets', 'stylesheets', 'less')])
      less = ('@import \'bootstrap.less\';' + user_variables)
      tree = parser.parse(less)
      content = tree.to_css(:compress => true)

      path = Rails.root.join('public', filename)
      File.open(path, 'w') { |file| file.write(content) }
    end
  end
end
