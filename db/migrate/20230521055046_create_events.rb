class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date       :event_day, null: false
      t.string     :title,     null: false
      t.text       :content,   null: false
      t.integer    :grade_id,  null: false
      t.references :room,      null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
