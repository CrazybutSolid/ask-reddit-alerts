json.array!(@alerts) do |alert|
  json.extract! alert, :id, :user_id, :keyword
  json.url alert_url(alert, format: :json)
end
