module YmUsers::User
  
  def self.included(base)
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    base.devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

    base.attr_protected :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    base.image_accessor :image
  end
  
  def admin?
    role == "admin"
  end
  alias_method :is_admin?, :admin?
  
  def to_s
    "#{first_name} #{last_name}".strip
  end
  
end