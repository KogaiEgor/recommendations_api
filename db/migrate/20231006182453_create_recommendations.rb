class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.string :recommendation_text
      t.integer :consultation_request_id

      t.timestamps
    end
  end
end
