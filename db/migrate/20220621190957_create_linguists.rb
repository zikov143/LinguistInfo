class CreateLinguists < ActiveRecord::Migration[5.1]
  def change
    create_table :linguists do |t|
      t.string :firstname
      t.string :lastName
      t.string :country
      t.string :nativelanguage
      t.string :targetLanguages
      t.string :url
    end
  end
end
