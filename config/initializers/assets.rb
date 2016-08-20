# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( page_basic.css )
Rails.application.config.assets.precompile += %w( page_dark.css )
Rails.application.config.assets.precompile += %w( page_bright.css )
Rails.application.config.assets.precompile += %w( page_normal.css )
Rails.application.config.assets.precompile += %w( feedbacks.coffee )
Rails.application.config.assets.precompile += %w( offers.coffee )
Rails.application.config.assets.precompile += %w( advantages.coffee )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
