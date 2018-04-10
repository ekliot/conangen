class CreateCanSpeaks < ActiveRecord::Migration[5.0]
  def change
    create_table :can_speaks do |t|
      # references
      t.references :speaker, polymorphic: true, index: true # adds fields: speaker_id, speaker_type
      t.belongs_to :language, index: true
    end
  end
end
