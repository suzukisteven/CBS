class AddVideoResults < ActiveRecord::Migration[5.2]
    def change
        add_column :videos, :result_happy, :string, array: true, default: []
        add_column :videos, :result_sad, :string, array: true, default: []
        add_column :videos, :result_anger, :string, array: true, default: []
        add_column :videos, :result_contempt, :string, array: true, default: []
        add_column :videos, :result_disgust, :string, array: true, default: []
        add_column :videos, :result_fear, :string, array: true, default: []
        add_column :videos, :result_neutral, :string, array: true, default: []
        add_column :videos, :result_surprise, :string, array: true, default: []
        add_column :videos, :time, :string, array: true, default: []
    end
  end
  