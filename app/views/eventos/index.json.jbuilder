json.array!(@eventos) do |evento|
  json.extract! evento, :descripcion, :persona_id
  json.url evento_url(evento, format: :json)
end
