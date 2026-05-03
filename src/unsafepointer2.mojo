#from std.memory import alloc, UnsafePointer
from std.memory import alloc

def main():
    # 1. Allocate space for 5 Int
    var size = 5
    var ptr = alloc[Int](size)
    
    # 2. Initialize the memory
    for i in range(size):
        (ptr + i).init_pointee_copy(i * 100)

    # Use the value
    for i in range(size):
        print(ptr[i])

    # 3 & 4. Cleanup
    ptr.destroy_pointee()
    ptr.free()
