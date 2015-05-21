class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      #t.string "project"
      t.string "title"
      t.string "start_date"
      #t.string "end_date"
      t.time "start_time"
      t.time "end_time"
      t.string "minute_taker"
      t.string "attendee"
      t.string "mob_nos"
      #t.string "place"
      t.string "about_meeting"
      #t.string "topic"
      t.string "type_o"
      #t.string "note"
      t.string "owner"
      t.timestamps
    end
  end
end
