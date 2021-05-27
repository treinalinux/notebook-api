class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind
  has_many :phones
  has_one :address

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
