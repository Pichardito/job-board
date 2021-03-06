class User < ActiveRecord::Base
  require 'digest/sha1'
  include ActiveModel::Validations
  authenticates_with_sorcery!
  has_many :prospect_cards
  has_many :prospect_card_likes
  has_many :recruiter_cards
  has_many :recruiter_card_likes

  validates :email, uniqueness: true, presence: true,  email: true
  validates :password, :presence => true,
            :confirmation => true,
            :length => {:within => 6..40},
            :on => :create

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + auth.extra.access_token.params[:oauth_expires_in].to_i
      user.linkedin_email = auth.info['email']
      user.linkedin_profile_img = auth.info['image']
      user.email = auth.info['email']
      rand_string = (0...8).map { (65 + rand(26)).chr }.join #VARIABLE USED TO GENERATE RANDOME PASSWORD
      user.password = Digest::SHA1.hexdigest rand_string
      #user.salt = ?? SORCERY HANDLES AUTOMATICALLY PERHAPS
      user.first_name = auth.info.name.split(' ')[0]
      user.last_name = auth.info.name.split(' ')[1]
      user.save!
    end
  end
end
