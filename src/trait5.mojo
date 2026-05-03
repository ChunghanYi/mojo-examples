from std.collections import List

def main():
    # Create an initial list
    var list1: List[Int] = [1, 2, 3]

    # Create a deep copy using .copy()
    var list2 = list1.copy()
    
    # Modify the new list
    list2.append(4)
    
    # Print results to show independence
    print("List 1:", list1) # Output: [1, 2, 3]
    print("List 2:", list2) # Output: [1, 2, 3, 4]
    
    print("Addresses are different:", Pointer(to=list1) != Pointer(to=list2))

    
