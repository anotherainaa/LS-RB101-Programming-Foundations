Question 2
---
Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1. what is `!=` and where should you use it?
1. put `!` before something, like `!user_name`
1. put `!` after something, like `words.uniq!`
1. put `?` before something
1. put `?` after something
1. put `!!` before something, like `!!user_name`

My answer
---
`!` can be a unary operator which means not equal to. 
`!` can also be used in methods to indicate that the method modifies the orignal object.

`?` is used with methods that return a `boolean` value i.e ternary operator

1. `!=` is the operator for not equal to. This can be used in condiditonals.
2. `!` before something means not. `!user_name` means if `user_name` is not true  
3. `!` after something, like `words.uniq!` means that the method `uniq!` modifies the original object. Calling `uniq!` on `words` will return the same array with unique elements in it.
4. `?` turn integer into string when placed before it. Returns an error when used with a string
5. Turns something into a conditional
6. Returns true

LS answer
---
Just to clarify, if you see `!` or `?` at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

- `!=` means "not equals"
- `? :` is the ternary operator for if...else
- `!!<some object>` is used to turn any object into their boolean equivalent. (Try it in irb)
- `!<some object>` is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.

Notes
---
- When `!` or `?` is in a method, it is part of the method name and not a Ruby syntax.
- Need to brush up on description of `!!<some object>` & `!<some object>`
