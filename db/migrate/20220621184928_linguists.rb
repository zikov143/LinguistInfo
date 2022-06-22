class Linguists < ActiveRecord::Migration[5.1]
  def change
    create_table "Linguists", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
      t.string: firstname
      t.string: lastName
      t.string: country
      t.string: nativelanguage
      t.string: targetLanguages
      t.string: url
    end
  end
end
