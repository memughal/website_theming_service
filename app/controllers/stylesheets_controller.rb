require 'less'
class StylesheetsController < ApplicationController
  def new
    CompilerJob.delay.compile
  end
end
