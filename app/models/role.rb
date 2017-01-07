class Role < ActiveRecord::Base

  # acts_as_authorization_role join_table_name: :roles_users

  has_and_belongs_to_many :users


  def self.time_zone_aware_attributes
   false
  end

  # do I18n instead if you need it
  def fe_name
    {
    'admin' => 'Administrator',
    'user' => 'Benutzer'
    }[self.name]
  end

end
