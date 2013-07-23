json.array!(@leads) do |lead|
  json.extract! lead, :name, :email, :age, :sex, :unsubscribe
  json.url lead_url(lead, format: :json)
end
