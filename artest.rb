#!/usr/bin/env ruby

require 'active_record'

ActiveRecord::Base
  .establish_connection adapter: 'sqlite3', database: 'data.sqlite'

def make_tables
  ActiveRecord::Schema.define(version: 201_402_071_620_00) do
    create_table 'chairs', force: true do |t|
      t.integer 'table_id'
      t.integer 'legs'
    end

    create_table 'tables', force: true do |t|
      t.string 'user'
    end
  end
end

class Table < ActiveRecord::Base
  has_many :chairs
end

class Chair < ActiveRecord::Base
  belongs_to :table
end
