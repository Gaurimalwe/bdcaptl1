class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
     t.integer "create_owner_id"
      t.string :name
       #t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
