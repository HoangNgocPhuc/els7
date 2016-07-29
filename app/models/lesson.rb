class Lesson < ActiveRecord::Base
  after_create :update_name
  has_many :activities
  has_many :results
  
  belongs_to :user
  belongs_to :caterory

  def update_name
    update_attribute(:name, Settings.paragraph + self.caterory.name)
  end
end
