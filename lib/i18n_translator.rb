require 'i18n_translator/version'
module I18nTranslator
  class << self
    attr_accessor :configuration

    def configure
      # self.configuration ||=
      # yield(configuration) if block_given?
      Configuration.new
    end

  end

  class Configuration
    attr_accessor :model_locale_path, :translation_source_locale, :locales

    def initialize
      @model_locale_path = 'config/locales/models'
      @translation_source_locale = I18n.default_locale
      @locales = I18n.available_locales rescue []
    end
  end
end
