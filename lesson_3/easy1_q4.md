Question 4
---

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset `numbers` to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```

My answer
---
`numbers.delete_at(1)` will delete the value of element at index number 1 returning the value of the deleted index which in this case is `2`. `numbers` array will now be `[1, 3, 4, 5]`

`numbers.delete(1)` will delete all elements with the value of 1 returning the deleted value in this case is `1`. `numbers` array will now be`[2, 3, 4, 5]`

LS answer
---
```ruby
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
```
(note that the array is operated on directly and the return value of the call is the removed item `2`)

```ruby
numbers.delete(1) # numbers is now [2, 3, 4, 5]
```
(note that the array is operated on directly and the return value of the call is the removed item `1`)

Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place(rather than just returning a modified version of the array) these methods do not have the usual `!`at the end of the method name for "modify in place" method names.