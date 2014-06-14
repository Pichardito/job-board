class RecruiterCard < ActiveRecord::Base
  belongs_to :users

  def to_s
    "#{self.title} from #{self.name}"
  end

end
