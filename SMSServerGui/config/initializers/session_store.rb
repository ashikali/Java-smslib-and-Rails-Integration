# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_checkrails_session',
  :secret      => 'eb2335e9b961a35f4617223b95ac0915c7b1c217948d9ce4ed79d97273e71376676dbc54857b011da82b911190ad71bf300b45e1fe7d80e301aff30241884a90'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
