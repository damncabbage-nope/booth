require 'spec_helper'

describe "Events" do
  context "when visiting the homepage" do

    context "with one active event" do
      before do
        visit root_path
      end
      it "should display content" do
        page.should have_content("SMASH!")
      end
    end

  end
end

