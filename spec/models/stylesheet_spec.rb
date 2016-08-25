require 'rails_helper'

describe Stylesheet do

  it "should be invalid" do
    stylesheet = Stylesheet.new
    expect(stylesheet).to_not be_valid
    expect(stylesheet.errors.messages.first).to include(:base, ["Please add atleast one property"])
  end

  it "should be valid when only text color is set" do
    stylesheet = Stylesheet.new(:text_color => '#009999')
    expect(stylesheet).to be_valid
  end

  it "should be valid when only link color is set" do
    stylesheet = Stylesheet.new(:link_color => '#009999')
    expect(stylesheet).to be_valid
  end
end
