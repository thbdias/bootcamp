class Contact < ApplicationRecord
    has_many :phones #possui muitos telefones
    has_one :address #possui um endereco

    has_many :contact_kinds #possui muitos <tabela intermediaria>
    has_many :kinds, through: :contact_kinds #possui muitos kinds através da <tabela intermediaria>
end
