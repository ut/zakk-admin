ENV['RAILS_ENV'] ||= 'staging'
ENV['GEM_PATH'] ||= '/home/pacs/mih15/.rvm/gems/ruby-2.3.3'




# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
