# Configure your session store
# This cookie-based session store is the Rails default. It is dramatically faster than the alternatives.

# Sessions typically contain at most a user_id and flash message; both fit within the 4K cookie size limit. A CookieOverflow exception is raised if you attempt to store more than 4K of data.

# The cookie jar used for storage is automatically configured to be the best possible option given your application's configuration.

# If you only have secret_token set, your cookies will be signed, but not encrypted. This means a user cannot alter their user_id without knowing your app's secret key, but can easily read their user_id. This was the default for Rails 3 apps.

# If you have secret_key_base set, your cookies will be encrypted. This goes a step further than signed cookies in that encrypted cookies cannot be altered or read by users. This is the default starting in Rails 4.

# If you have both secret_token and secret_key base set, your cookies will be encrypted, and signed cookies generated by Rails 3 will be transparently read and encrypted to provide a smooth upgrade path.

# Configure your session store in config/initializers/session_store.rb:
# Rails.application.config.session_store :cookie_store, key: 'audiophile'

# Configure your secret key in config/secrets.yml:

# development:
#   secret_key_base: 'secret key'
# To generate a secret key for an existing application, run `rake secret`.

# If you are upgrading an existing Rails 3 app, you should leave your existing secret_token in place and simply add the new secret_key_base. Note that you should wait to set secret_key_base until you have 100% of your userbase on Rails 4 and are reasonably sure you will not need to rollback to Rails 3. This is because cookies signed based on the new secret_key_base in Rails 4 are not backwards compatible with Rails 3. You are free to leave your existing secret_token in place, not set the new secret_key_base, and ignore the deprecation warnings until you are reasonably sure that your upgrade is otherwise complete. Additionally, you should take care to make sure you are not relying on the ability to decode signed cookies generated by your app in external applications or Javascript before upgrading.

# Note that changing the secret key will invalidate all existing sessions!