class RecruiterCardLike < ActiveRecord::Base
  belongs_to :users
  belongs_to :recruiter_cards
end
