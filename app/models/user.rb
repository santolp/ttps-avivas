class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, [:admin , :gerente , :empleado ], suffix: true




  after_initialize do
    if self.new_record?
      self.role ||= :empleado
    end
  end
  

  
end
