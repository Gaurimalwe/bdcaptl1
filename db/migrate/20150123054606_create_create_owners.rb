class CreateCreateOwners < ActiveRecord::Migration
  def change
    create_table :create_owners do |t|
      t.string "name"
      t.integer "floor"
      t.string "block"
      t.integer "flat_number"
      t.string "business_name"
      t.string "username"
      t.string :password_digest
      t.string :image
      t.integer "carpet_area"
      t.integer "builtup_area"
      t.string "mezzanine"
      t.string "water_connection"
      t.string "electricity"
      t.string "ownership"
      t.string "month_from"
      t.string "month_to"
      t.integer "per_month_rent"
      t.string :auth_token

      t.timestamps
    end
  end
end
