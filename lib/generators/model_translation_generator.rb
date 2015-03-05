require 'i18n_translator/models/model_translation'
require 'i18n_translator/translator/key_translator'
class ModelTranslationGenerator < Rails::Generators::Base
  def create_models_translations
    load_models
    generate_translations
  end

  private

  def generate_translations
    @models.each do |model|
      # I18nTranslator.configuration.locales.each do |locale|
      [:de, :en].each do |locale|
        # path = "#{I18nTranslator.configuration.model_locale_path}/#{model.to_s.tableize.singularize}/#{locale}.yml"
        path = "#{Rails.root}/config/locales/models/#{model.to_s.tableize.singularize}/#{locale}.yml"
        unless exists_translation?(path)
          content = I18nTranslator::Models::ModelTranslation.generate_model_translation(model, locale)
          create_file path, content
        end
      end
    end
  end

  def load_models

    def exists_translation?(path)
      File.exist?(path)
    end

    Rails.application.eager_load!
    @models = ActiveRecord::Base.descendants
    @models.delete([ActiveRecord::SchemaMigration])
    @models.reject! {|model| model.name.include?('HABTM') | !model.table_exists?}
  end
end


