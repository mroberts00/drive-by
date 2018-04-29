class Shooting < ApplicationRecord
    has_many :victims, dependent: :destroy
end
