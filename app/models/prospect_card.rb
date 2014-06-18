class ProspectCard < ActiveRecord::Base
  belongs_to :users
  has_many :prospect_card_likes

  def to_s
    "#{self.title} from #{self.name}"
  end

end
