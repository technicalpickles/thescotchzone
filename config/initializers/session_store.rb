# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thescotchzone_session',
  :secret      => '798d6dc3f0959d581cb79b754a26165aceaa3c935693ddad46cf09497b5b69efd7a5e343737c759c8091837d92208e8463c0208fac5bee0d118755a05e19e1e3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
