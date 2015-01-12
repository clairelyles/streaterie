class Cuisine < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: { message: "Cuisine already added. Please try again." },
            unless: :name =~ /\d/

  validates :recipe,  presence: true, length: { minimum: 5, message: "Please include at least 2 related recipies" }, uniqueness: true
end
