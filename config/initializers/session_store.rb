# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dsp_session',
  :secret      => '4127fde2bfb20bbf5c00eb8e26f99b80ccf62d1524b7e607ef0d5788fe1281078ab2768f5ba0cc95cff6c3a5c1d3cd83a20e3ccceb968ef040df6fc6cfad9766'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
