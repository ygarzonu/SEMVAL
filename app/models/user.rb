class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :authentication_keys => [:username]

   	validates_presence_of :username


   	has_many :comments


   	has_many :procesos, dependent: :destroy

    validates :username, presence: :true
    
   	
   	ROLES = %w[admin altaDir lider pueblo]

   	def roles=(roles)
	  self.permission_level = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
	  ROLES.reject do |r|
	    ((permission_level.to_i || 0) & 2**ROLES.index(r)).zero?
	  end
	end

end
