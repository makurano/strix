class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string     :degree
      t.string     :affiliation
      t.string     :research_fields
      t.string     :contact
      t.string     :education
      t.string     :academic_affiliations
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
