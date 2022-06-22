# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20220621190957) do

  create_table "extractedlinguists", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "FirstName", limit: 1555
    t.string "LastName", limit: 1665
    t.string "Country", limit: 1245
    t.string "NativeLanguage", limit: 1545
    t.string "TargetLanguages", limit: 1745
    t.string "SourceLink", limit: 1245
  end

  create_table "linguists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "firstname"
    t.string "lastName"
    t.string "country"
    t.string "nativelanguage"
    t.string "targetLanguages"
    t.string "url"
  end

end
