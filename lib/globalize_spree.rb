require 'spree_core'
require 'globalize_spree_hooks'

module GlobalizeSpree
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      #easy-globalize-accessors functionality
      ActiveRecord::Base.send :include, ActiveRecord::GlobalizeAccessors
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      #enable locale fallbacks to avoid nasty errors
      I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
