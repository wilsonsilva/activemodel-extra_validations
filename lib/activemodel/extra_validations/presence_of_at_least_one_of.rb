require 'active_model'

module ActiveModel
  module Validations
    # Validates whether at least one of the specified attributes is present.
    class PresenceOfAtLeastOneOfValidator < Validator
      ERROR_MESSAGE = 'This validator requires at least two arguments.'.freeze

      def initialize(options = {})
        super(options)

        check_validity!
      end

      def validate(record)
        at_least_one_present = attribute_names.any? do |attribute_name|
          record.attributes[attribute_name.to_s].present? || !record.attributes[attribute_name.to_s].nil?
        end

        add_errors_to_record(record) unless at_least_one_present
      end

      private

      def add_errors_to_record(record)
        attribute_names.each do |attribute_name|
          record.errors.add(attribute_name, error_message_or_error_type, one_of: attribute_names)
        end
      end

      def check_validity!
        raise ArgumentError, ERROR_MESSAGE unless options[:attributes].many?
      end

      def attribute_names
        options[:attributes]
      end

      def error_message_or_error_type
        options[:message] || :presence_of_at_least_one_of
      end
    end

    # Methods to be automatically included on every ActiveModel instance
    module HelperMethods
      # Validates whether at least one of the specified attributes is present.
      #
      #   class BillingDetails < ActiveRecord::Base
      #     validate_presence_of_at_least_one_of :credit_card, :debit_card
      #   end
      #
      # Configuration options:
      # * <tt>:message</tt> - Specifies a custom error message (default is: "is
      #   not included in the list").
      #
      # See <tt>ActiveModel::Validations#validates</tt> for more information
      #
      def validate_presence_of_at_least_one_of(*attribute_names)
        validates_with PresenceOfAtLeastOneOfValidator, _merge_attributes(attribute_names)
      end
    end
  end
end
