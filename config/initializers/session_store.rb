# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Lanportalen_session',
  :secret      => '7ef9cb49e1bc15d65242ed828e7560cae3d270c81953f925c0cd6413a1dcaf5f55a95b406f276ccdd398a18956a8447f1a9a44c83b20f61a46e3a1722bbc2090'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
