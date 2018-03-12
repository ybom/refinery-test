class CreateFaqsFaqs < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_faqs do |t|
      t.int :id
      t.text :question
      t.text :answer
      t.string :category
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-faqs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/faqs/faqs"})
    end

    drop_table :refinery_faqs

  end

end
