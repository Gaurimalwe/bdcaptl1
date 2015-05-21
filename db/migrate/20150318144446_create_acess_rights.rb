class CreateAcessRights < ActiveRecord::Migration
  def change
    create_table :acess_rights do |t|
      t.integer "create_owner_id"
      # can also use: t.references :subject
      t.string "name"
      t.string "can"
      t.string "perform"
      t.timestamps
    end
    add_index("acess_rights", "create_owner_id")
end
end
