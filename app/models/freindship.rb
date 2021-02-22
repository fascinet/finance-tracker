class Freindship < ApplicationRecord
  belongs_to :user
  belongs_to :freind, class_name: 'User'
end
