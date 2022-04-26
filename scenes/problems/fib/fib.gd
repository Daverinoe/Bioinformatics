extends Control


func calculate_fibonacci(n:int, k:int) -> String:
	var count = 0
	
	var fib_min_2 = 0
	var fib_min_1 = 0
	var fib_0 = 0
	
	while count < n:
		count += 1
		if count == 1:
			fib_0 = 1
		elif count == 2:
			fib_min_1 = 1
			fib_0 = 1
		else:
			fib_min_2 = fib_min_1
			fib_min_1 = fib_0
			# Rabbits take a month to mature, so every F(n-2) should be multiplied by k to account
			# for the increase in population.
			fib_0 = k * fib_min_2 + fib_min_1
		
	return "%s" % fib_0

# Recursive version. Runs worse than O(n) time though, since it involves calculating many things again.
# Could be fix with memoization?
func fib_recursive(n:int, k:int) -> int:
	if n == 1 or n == 2:
		return 1
	else:
		return fib_recursive(n-1, k) + k * fib_recursive(n-2, k)

func _on_Button_pressed() -> void:
	$"RichTextLabel".text = calculate_fibonacci(int($"n".text), int($"k".text))
