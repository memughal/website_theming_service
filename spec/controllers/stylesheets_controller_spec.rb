require 'rails_helper'

RSpec.describe StylesheetsController, type: :controller do

  describe "customization" do

    it "should render new stylesheet form" do
      get :new
      assert_template :new
    end

    describe '#create' do
      context "when valid" do
        let(:params) do
          { :stylesheet => {:link_color => '#009999'} }
        end

        it "should return customized stylesheet url" do
          post :create, params: params

          expect(response).to redirect_to(action: 'new')

          expect(flash[:url]).to be_present
          expect(flash[:url]).to match(/https?:\/\/[\S]+\/custom_css_[\d]+\.css$/)

          path = Rails.root.join('public', File.basename(flash[:url]))
          expect(File).to exist(path)
        end
      end

      context "when invalid" do
        let(:params) do
          { :stylesheet => {:link_color => ''} }
        end

        it "should render new form" do
          post :create, params: params

          assert_template :new
        end
      end
    end
  end
end
