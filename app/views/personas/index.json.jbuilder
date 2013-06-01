json.array!(@personas) do |persona|
  json.extract! persona, :nombre, :apellido
  json.url persona_url(persona, format: :json)
end
