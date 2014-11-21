json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :video_code
  json.url episode_url(episode, format: :json)
end
