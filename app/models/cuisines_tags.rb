class CuisinesTags < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :tag
end
