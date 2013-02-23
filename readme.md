# Widgets extension for Refinery CMS.

## How does it work?
  You make an HTML widget on the awidgets tab of your admin.

### Hurray - I have a widget now what?
Now in your pages or other HTML You can use the HTML tag
    <widget name="widget-name-here"></widget>
During render, your widget tag gets replaced by whatever is in the widget-name-here widget.
Table of Contents for large sections of your page?  Custom side bars on certain sections?
If this is TOO MUCH for you consider the [refinerycms-copywriting](https://github.com/unixcharles/refinerycms-copywriting) gem.

## Requirements:
Refinerycms 2-0-stable or higher

## Install the widgets gem
In your gemfile include:

    gem "refinerycms-widgets"

## Configuration changes needed
We have to allow the widget tag in the WYM editor.  RefineryCMS has an config option for us.
  
In your config directory go to initializers/refinery/core.rb and make sure your config for wymeditor_whitelist_tags has this value for widget.
    config.wymeditor_whitelist_tags = {
      "widget" => { "attributes" => ["name"] }
    }

note: this sometimes requires a rake assets:clean task run to clear out old JS.

Now we need to add some middleware:  in config/application.rb

    config.middleware.use("Refinery::Widgets::Middleware")
    
## TODO
* Widget caching
