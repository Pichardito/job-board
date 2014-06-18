class RecruiterCard < ActiveRecord::Base
  belongs_to :users
  has_many :recruiter_card_likes

  def to_s
      "#{self.title} from #{self.name}"
  end

  scope :likes_for_user_cards, ->(user) { RecruiterCardLike.where(recruiter_card_id: user.recruiter_cards) }
end
