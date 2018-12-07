-- string
print('-- string')
print('hello', "world")
print('hello ' .. "world")
print('hello ' .. 123)
print(123 .. ' hello')
print(string.format('%s, %d', 'hello', 123))
print(string.format('%s, %s', 'hello', 123)) -- not works on ios
print()

print('"123" == 123', "123" == 123)
print()

print(string.reverse("12345"))
print(string.upper("abc123"), string.lower("中文ABC"))
print(string.sub("abc123", 3, 5))
print()

-- error will occur
-- print(string.sub("中文ABC", 3))
-- print()

print(string.rep("abc|", 3))
print(string.byte("abc|", 1))
print(string.byte("abc|", 2, 3))
print(string.byte("中文", 1, 6))
print(string.char(string.byte("中文", 1, 3)))
print(string.char(228, 184, 173))
print(string.len("中文"), string.len("abc"))