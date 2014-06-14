class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :prospect_cards
  #COMMENTED OUT BECAUSE THEY CONFLICT WITH LINKEDIN OAUTH

  # validates_presence_of :password, on: :create
  # validates_presence_of :email, on: :create
  # validates_uniqueness_of :email

  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + auth.extra.access_token.params[:oauth_expires_in].to_i
      user.linkedin_email = auth.info['email']
      user.linkedin_profile_img = auth.info['image']
      #POSSIBLE DUMMY VARIABLES TO FORCE PASS VALIDATION
      #PLACEHOLDER PASSWORD TO PASS VALIDATIONS
      user.password = user.crypted_password
      #user.email = 'auth.info['email']
      user.save!
    end
  end

end
