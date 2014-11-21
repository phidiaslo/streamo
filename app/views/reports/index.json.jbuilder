json.array!(@reports) do |report|
  json.extract! report, :id, :name, :problem, :other
  json.url report_url(report, format: :json)
end
