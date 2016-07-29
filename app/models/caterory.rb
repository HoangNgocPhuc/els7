class Caterory < ActiveRecord::Base
  has_many :lessons
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum_name_category}
end
