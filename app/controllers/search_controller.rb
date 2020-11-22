class SearchController < ApplicationController
  def index
    search_result = Elasticsearch::Model.search(params[:query].to_s, [Book]).records.records
    search_result = Autocompleter.call(params[:query].to_s)

    render json: search_result, status: search_result.any? ? :found : :not_found
  end
end
