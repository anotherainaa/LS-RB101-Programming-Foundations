# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

HEXADECIMEL = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']

def generate_uuid
  uuid = []

  section = [8, 4, 4, 4, 12]
  section.each do |number|
    number.times { uuid << HEXADECIMEL.sample }
    uuid << '-' unless number == 12
  end
  uuid.join
end

p generate_uuid