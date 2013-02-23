# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Widgets" do
    describe "Admin" do
      describe "widgets" do
        login_refinery_user

        describe "widgets list" do
          before do
            FactoryGirl.create(:widget, :name => "UniqueTitleOne")
            FactoryGirl.create(:widget, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.widgets_admin_widgets_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.widgets_admin_widgets_path

            click_link "Add New Widget"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Widgets::Widget.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Widgets::Widget.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:widget, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.widgets_admin_widgets_path

              click_link "Add New Widget"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Widgets::Widget.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:widget, :name => "A name") }

          it "should succeed" do
            visit refinery.widgets_admin_widgets_path

            within ".actions" do
              click_link "Edit this widget"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:widget, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.widgets_admin_widgets_path

            click_link "Remove this widget forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Widgets::Widget.count.should == 0
          end
        end

      end
    end
  end
end
