def multiplier[factor: Int](x: Int) -> Int:
    return x * factor

def main():
    comptime times_ten = multiplier[10]
    x10 = times_ten(3)
    print(x10)  # prints 30