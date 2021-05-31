class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  # def author
  #   'Alan da Sila Alves'
  # end

  meta do
    { author: 'Alan da Silva Alves' }
  end

  def attributes(*args)
    h = super(*args)
    # Format date on pt-BR
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    #
    # Format date Default recommend of json_api use ISO 8601 W3C
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
