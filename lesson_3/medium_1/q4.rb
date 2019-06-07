array = %w(a b c d)
max_size = 5

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

array2 = rolling_buffer1(array, max_size, 'e')
p array.object_id
p array2.object_id

array2 = rolling_buffer2(array, max_size, 'f')
p array.object_id
p array2.object_id