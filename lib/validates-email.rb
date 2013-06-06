require 'active_record'
require 'method'

class ActiveRecord::Base
  extend ValidatesEmail::Validations::ClassMethods
  ActiveRecord::Base.send :include, ValidatesEmail::Validations
end
