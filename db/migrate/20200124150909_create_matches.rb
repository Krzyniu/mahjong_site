class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :player_1
      t.integer :player_1_score
      t.references :player_2
      t.integer :player_2_score
      t.references :player_3
      t.integer :player_3_score
      t.references :player_4
      t.integer :player_4_score

      t.timestamps
    end
  end
end
