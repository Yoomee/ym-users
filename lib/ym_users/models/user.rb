module YmUsers::User
  
  def self.included(base)
    base.send(:include, YmCore::Model)
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    base.devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable

    base.attr_protected :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    
    base.validates_presence_of :email, :first_name, :last_name
    base.validates :email, :email => true, :uniqueness => true, :allow_blank => true
    base.validates_presence_of :password, :on => :create
    base.image_accessor :image
    base.send(:validates_property, :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image")
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    
    def has_roles(*args)
      args.each do |role|
        define_method("#{role}?") do
          role_is?(role)
        end
      end
    end
    
  end
  
  def admin?
    role_is?(:admin)
  end
  alias_method :is_admin?, :admin?
  
  def full_name
    "#{first_name} #{last_name}".strip
  end
  
  def full_name=(val)
    names = val.split(" ")
    self.last_name = names.pop if names.length > 1
    self.first_name = names.join(" ")
    val
  end
  
  def role_is?(role_type)
    role.present? && (role == role_type.to_s)
  end
  
  def to_s
   full_name
  end
  
  def yoomee_staff?
    admin? && email.in?(YmUsers::YOOMEE_EMAILS)
  end
  
end

YmUsers::YOOMEE_EMAILS = %w{rich@yoomee.com ian@yoomee.com matt@yoomee.com andy@yoomee.com nicola@yoomee.com edward@yoomee.com}