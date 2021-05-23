# frozen_string_literal: true

# Class  Contact
class Contact < ApplicationRecord
  # belongs_to :kind, optional: true
  belongs_to :kind

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
