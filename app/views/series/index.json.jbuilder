json.array!(@series) do |series|
  json.extract! series, :id, :name, :synopsis, :status
  json.url series_url(series, format: :json)
end
