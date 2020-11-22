module Utilities
  module ElasticsearchImporter
    def self.import
      Book.__elasticsearch__.create_index!(force: true)
  
      Book.find_in_batches do |records|
        bulk_index(records)
      end
    end
  
    def self.bulk_index(records)
      Book.__elasticsearch__.client.bulk(
        index: Book.__elasticsearch__.index_name, 
        type: Book.__elasticsearch__.document_type,
        body: prepare_records(records)
      )
    end
  
    def self.prepare_records(records)
      records.map do |record|
        {
          index: {
            _id: record.id,
            data: record.__elasticsearch__.as_indexed_json
          }
        }
      end
    end
  end
end
