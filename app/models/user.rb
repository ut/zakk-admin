class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "ist keine Email")
    end
  end
end

class User < ActiveRecord::Base

	acts_as_paranoid

  devise  :database_authenticatable,
          :timeoutable,
		      :recoverable, 
          :trackable,
          :lockable,
		      :validatable,
          :timeout_in => (5*60).minutes

  has_and_belongs_to_many :roles

  validates :login, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { within: 3..40 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    email: true

  with_options if: :password_was_set? do |i|
    i.validates :password, length: { within: 4..40 }
    i.validates_confirmation_of :password
  end


  self.per_page = (Rails.env == 'development') ? 5 : 20

  def admin?
    has_role? :admin
  end

  def has_role?(role)
    roles.collect(&:name).include?(role.to_s)
  end

  private

  def password_was_set?
    password.present?
  end

end
