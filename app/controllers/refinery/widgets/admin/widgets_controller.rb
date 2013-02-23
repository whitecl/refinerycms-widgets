module Refinery
  module Widgets
    module Admin
      class WidgetsController < ::Refinery::AdminController

        crudify :'refinery/widgets/widget',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
