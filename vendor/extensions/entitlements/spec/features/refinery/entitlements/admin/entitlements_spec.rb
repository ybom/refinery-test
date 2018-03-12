# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Entitlements" do
    describe "Admin" do
      describe "entitlements", type: :feature do
        refinery_login

        describe "entitlements list" do
          before do
            FactoryGirl.create(:entitlement, :rank => "UniqueTitleOne")
            FactoryGirl.create(:entitlement, :rank => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.entitlements_admin_entitlements_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.entitlements_admin_entitlements_path

            click_link "Add New Entitlement"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Rank", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Entitlements::Entitlement, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Entitlements::Entitlement, :count)

              expect(page).to have_content("Rank can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:entitlement, :rank => "UniqueTitle") }

            it "should fail" do
              visit refinery.entitlements_admin_entitlements_path

              click_link "Add New Entitlement"

              fill_in "Rank", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Entitlements::Entitlement, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:entitlement, :rank => "A rank") }

          it "should succeed" do
            visit refinery.entitlements_admin_entitlements_path

            within ".actions" do
              click_link "Edit this entitlement"
            end

            fill_in "Rank", :with => "A different rank"
            click_button "Save"

            expect(page).to have_content("'A different rank' was successfully updated.")
            expect(page).not_to have_content("A rank")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:entitlement, :rank => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.entitlements_admin_entitlements_path

            click_link "Remove this entitlement forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Entitlements::Entitlement.count).to eq(0)
          end
        end

      end
    end
  end
end
