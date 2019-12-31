# Load the Rails application.
require_relative "application"

# Initialize the Rails application.

Rails.application.configure do
  # Whitelist one hostname
  config.hosts << "stokes-graveyard.cf"
  # Whitelist a test domain
  config.hosts << /application\.local\Z/
end

Rails.application.initialize!
