# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_generic_session',
  :secret      => '9de1c762b4e5642dcfc93661c856b2a1d6d5149b94955c4ef3bb50e503c17e7f21112da49774f4034ec4f280e622e02afd089aa2e47aca9919bf867d75814df8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
