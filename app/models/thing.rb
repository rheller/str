class Thing < ActiveRecord::Base
     belongs_to :user
     
     validates_presence_of :title
     validates_presence_of :description

#      acts_as_taggable #standard plugin
#      acts_as_taggable_on :category
end
