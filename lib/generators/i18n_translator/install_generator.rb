module I18nTranslator
  class InstallGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def copy_initializer
      copy_file '../templates/i18n_translator.rb', 'config/initializers/i18n_translator.rb'
    end
  end
end