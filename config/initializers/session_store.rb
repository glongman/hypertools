# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hypertools_session',
  :secret      => '365f52638041fb7c83529f2e68e9fed8092850f545401e2d1b8fd4b064df38c74362ebe8f94643e2169064488086e01a0fdce4f29703796cfcd15ad5d656f50a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
