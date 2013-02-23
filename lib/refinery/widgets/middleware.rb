module Refinery
  module Widgets
    class Middleware
      def initialize(app)
        @app = app
      end
      WIDGET_REGEXP = /\<widget\b[^>]*\>\<\/widget\>/
      
      def call(env)
        @status, @headers, @response = @app.call(env)
        widgetize(@response)
        [@status, @headers, @response]
      end
      
      def widgetize(response)
        response.each do |r|
          r.scan(WIDGET_REGEXP).each do |found|
            # first get the name of the widget
            widget_name = found.scan(/name\s*=\s*[\'\"](.*?)[\'\"]/).flatten[0]
            # then find the widget
            widget = Refinery::Widgets::Widget.where(name: widget_name).first
            widget_content = if widget
              widget.content
            else
             "<!-- missing widget: #{widget_name} -->"
            end
            # now replace the widget
            r.gsub!(found, widget_content)
          end
        end
        response
      end
    end
  end
end
