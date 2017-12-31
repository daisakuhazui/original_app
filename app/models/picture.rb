class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true, inverse_of: :picture
end
