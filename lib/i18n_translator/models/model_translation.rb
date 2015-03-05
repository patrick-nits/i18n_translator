module I18nTranslator
  module Models
    module ModelTranslation
      class << self

        def generate_model_translation(model, locale)
            active_record_hash = {active_record: {}}
            names = generate_model_names(model,locale)
            attributes = generate_model_attributes(model,locale)
            active_record_hash[:active_record].merge!(names)
            active_record_hash[:active_record].merge!(attributes)
            {locale.to_sym => active_record_hash}.deep_stringify_keys.psych_to_yaml
        end

        def generate_model_names(model,locale)
          model_name = model.to_s.tableize.split("/").last
          {models: {model.to_s.tableize.singularize.to_sym => {
              zero: model_name.to_s,
              one: model_name.pluralize,
              few: model_name.pluralize,
              many: model_name.pluralize,
              other: model_name.pluralize
          }}}
        end

        def generate_model_attributes(model,locale)
          hash = {}

          model.column_names.each do |column_name|
            hash.merge!({
                            column_name.to_sym => I18nTranslator::Translator::KeyTranslator.translate_key_if_required(column_name.capitalize.singularize,locale, :de).to_s
                        })
          end
          {attributes: {model.to_s.tableize.singularize.to_sym => hash}}
        end

      end
    end
  end
end