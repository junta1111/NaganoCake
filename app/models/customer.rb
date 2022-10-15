class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def full_name
           last_name + first_name
         end

         def full_name_kana
           last_name_kana + first_name_kana
         end

  has_many :cart_items

  def address_display
    '〒' + postal_code + '' + address + '' + full_name
  end
end

