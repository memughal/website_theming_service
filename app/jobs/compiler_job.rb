require 'less'
class CompilerJob < ActiveJob::Base

  def self.compile(stylesheet, filename)

    user_variables = ""
    user_variables << "@link-color:#{stylesheet.link_color};"

    if !user_variables.empty?
      Delayed::Worker.logger.add(Logger::INFO, 'started writing')

      parser = Less::Parser.new(paths: [Rails.root.join('vendor', 'assets', 'stylesheets', 'less')])
      less = ('@import \'bootstrap.less\';' + user_variables)
      tree = parser.parse(less)
      content = tree.to_css(:compress => true)

      path = Rails.root.join('public', filename)
      File.open(path, 'w') { |file| file.write(content) }

      Delayed::Worker.logger.add(Logger::INFO, 'done writing')
    end
  end
end
