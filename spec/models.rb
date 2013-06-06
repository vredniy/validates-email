class User < ActiveRecord::Base
  validates_email :email
end

class Person < ActiveRecord::Base
  validates :email, email: true
end
