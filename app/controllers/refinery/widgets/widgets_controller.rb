module Refinery
  module Widgets
    class WidgetsController < ::ApplicationController

      before_filter :find_all_widgets
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @widget in the line below:
        present(@page)
      end

      def show
        @widget = Widget.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @widget in the line below:
        present(@page)
      end

    protected

      def find_all_widgets
        @widgets = Widget.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/widgets").first
      end

    end
  end
end
