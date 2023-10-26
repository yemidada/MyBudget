class Group < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  mount_uploader :icon, IconUploader
end
