function print_plus1(n)
	print("plus1", n + 1)
end
print_plus1(1)
print()

print_plus2 = function(n)
	print("plus2", n + 2)
end
print_plus2(1)
print()

function do_func(callback, n)
	callback(n)
end
do_func(print_plus1, 1)
do_func(print_plus2, 1)
print()

print_plus1 = print_plus2
print_plus1(2)