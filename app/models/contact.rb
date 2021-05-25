# frozen_string_literal: true

# Class  Contact
class Contact < ApplicationRecord
  # Associations
  # belongs_to :kind, optional: true
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end
  # def birthdate_br
  #   I18n.l(birthdate) unless birthdate.blank?
  # end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end

  # def author
  #   'Alan Alves'
  # end

  # def kind_description
  #   kind.description
  # end

  # def as_json(_options = {})
  #   super(
  #     root: true,
  #     # methods: :author,
  #     # include: :kind
  #     # include: { kind: { only: :description }}
  #     # or:
  #     methods: %i[author kind_description]
  #   )
  # end
end
