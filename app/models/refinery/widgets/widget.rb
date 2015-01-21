module Refinery
  module Widgets
    class Widget < Refinery::Core::BaseModel
      self.table_name = 'refinery_widgets'

      acts_as_indexed :fields => [:name, :content]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
