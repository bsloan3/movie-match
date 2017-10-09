class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, { presence: true, uniqueness: true }
  validates :password, :username, { presence: true }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :reviews

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil unless user

    if user.password == password
      return user
    else
      return nil
    end
  end

end
