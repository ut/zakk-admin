require 'active_record/fixtures'

def load_em(fixtures_dir)
  Dir.glob("#{::Rails.root.to_s}/#{fixtures_dir}/*.yml").each do |file|
    unless File.basename(file) == "users.yml" && User.count > 0
      ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, File.basename(file, '.*'))
    end
  end
end


## load general fixtures
load_em("db/fixtures/seeds")

User.find_by_login('admin').roles  << Role.where( name: 'admin').first
User.find_by_login('user').roles << Role.where( name: 'user').first
