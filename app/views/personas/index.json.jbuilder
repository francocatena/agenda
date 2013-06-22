json.array!(@personas) do |persona|
  json.extract! persona, :id
  json.nombre persona.to_s
end
