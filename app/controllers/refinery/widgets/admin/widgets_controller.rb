module Refinery
  module Widgets
    module Admin
      class WidgetsController < ::Refinery::AdminController

        crudify :'refinery/widgets/widget',
                :title_attribute => 'name', :xhr_paging => true

        def widget_params
          params.require(:widget).permit(:name, :content, :position)
        end

      end
    end
  end
end
