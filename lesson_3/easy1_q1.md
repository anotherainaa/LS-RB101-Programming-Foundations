Question 1
---
What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

The code below will print out 

```Ruby
1
2
2
3
```

My answer
---  
This is because `numbers.uniq` returns a new array and does not mutate the original `numbers` array. 

LS answer
---
`numbers.uniq` returned a new `Array` object with unique elements, but it did not modify the `numbers` object. Further, the `puts` method automatically calls `to_s` on its argument, and that’s why you see the output like above.

Notes
---
- Don't forget difference between `puts` and `p`
- `uniq` method was not described
