class FilmResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "#{record.name}, #{record.author}"
  end
end
