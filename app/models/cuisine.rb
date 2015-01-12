class Cuisine < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: { message: "Cuisine already added. Please try again." }, numericality:false

  validates :recipe,  presence: true, length: { minimum: 10, maximum: 155, message: "Please include at least 2 related recipies and at most 200" }, uniqueness: true
end
