require 'bing_translator'
module I18nTranslator
  module Translator
    module KeyTranslator
      class << self
        def translate_key_if_required(key, locale_from, locale_to)
          if locale_from != :en
            translator = BingTranslator.new('i18n_translator', 'pxXiia8gDrEScWzutUG36kdI1ght4l+rZQ9K/QhY7/Y=', false, '6Q27hvaic5s6//Kss6zlJaB4QrhBwA5RwSAlz0Wr/vc')
            translator.translate key.split("_").join(" ").to_s, from: :en, to: :de
          else
            key
          end
        end
      end
    end
  end
end
