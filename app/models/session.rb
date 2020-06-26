class Session
  include ActiveModel::Model

  attr_accessor :email, :password


  validates :email, presence: true
  validates_format_of :email, with: /.+@.+/, allow_blank: false

  validate :check_email
  validates :password, presence: true
  validates :password, length: {minimum: 6}, if: :password


  def check_email
    user = User.find_by_email email
    if user.nil?
      errors.add :email, :not_found
    end
  end
end