a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |sub_hash|
  result = {}
  sub_hash.each do |key, value|
    result[key] = value + 1
  end
  result
end

p a