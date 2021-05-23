class AddKindToContact < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :kind, null: false, foreign_key: true
  end
end
