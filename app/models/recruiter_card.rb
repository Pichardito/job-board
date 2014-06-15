class RecruiterCard < ActiveRecord::Base
  belongs_to :users
  has_many :recruiter_card_likes

  def to_s
    "#{self.title} from #{self.name}"
  end

end
