# frozen_string_literal: true

require 'i18n'

require_relative 'extra_validations/version'

I18n.load_path += Dir[File.join(__dir__, 'extra_validations/locale/*.yml')]

module ActiveModel
  # Common ActiveModel validations
  module ExtraValidations
  end
end
