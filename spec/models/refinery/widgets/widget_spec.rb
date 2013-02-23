require 'spec_helper'

module Refinery
  module Widgets
    describe Widget do
      describe "validations" do
        subject do
          FactoryGirl.create(:widget,
          :name => "Refinery CMS", :content => "<em>Refinery CMS</em> - Refine the web!")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
        its(:content) { should == "<em>Refinery CMS</em> - Refine the web!" }
      end
    end
  end
end
