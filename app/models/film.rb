class Film < ApplicationRecord
  include Searchable

  validates_presence_of :name, :description, :author, :price, :duration

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, type: 'text', analyzer: 'ngram_analyzer', 
        search_analyzer: 'whitespace_analyzer'
      
      indexes :author, type: 'text', analyzer: 'ngram_analyzer', 
        search_analyzer: 'whitespace_analyzer'
    end
  end
end
