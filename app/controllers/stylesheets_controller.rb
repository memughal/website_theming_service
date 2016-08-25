require 'less'
class StylesheetsController < ApplicationController
  def new
    CompilerJob.compile
  end
end
