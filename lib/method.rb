module ValidatesEmail
  module Validations
    class EmailValidator < ::ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors[attribute] << (options[:message] || 'is invalid') unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      end
    end

    module ClassMethods
      def validates_email(*attr_names)
        validates_with ValidatesEmail::Validations::EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
