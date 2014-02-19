json.array!(@commitments) do |commitment|
  json.extract! commitment, :id, :title, :is_completed, :due_date, :status
  json.url commitment_url(commitment, format: :json)
end
