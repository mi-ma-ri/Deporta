class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.text :content,  null: false
      t.text :attack,  null: false
      t.text :attack_url,  null: false
      t.text :defence,  null: false
      t.text :defence_url,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
