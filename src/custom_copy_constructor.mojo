struct HeapArray(Copyable):
    var data: UnsafePointer[Int, MutExternalOrigin]
    var size: Int
    var cap: Int

    def __init__(out self, size: Int, val: Int):
        self.size = size
        self.cap = size * 2
        self.data = alloc[Int](self.cap)
        for i in range(self.size):
            (self.data + i).init_pointee_copy(val)

    def __init__(out self, *, copy: Self):
        # Deep-copy the existing value
        self.size = copy.size
        self.cap = copy.cap
        self.data = alloc[Int](self.cap)
        for i in range(self.size):
            (self.data + i).init_pointee_copy(copy.data[i])
        # The lifetime of `copy` continues unchanged

    def __del__(deinit self):
        # We must free the heap-allocated data, but
        # Mojo knows how to destroy the other fields
        for i in range(self.size):
            (self.data + i).destroy_pointee()
        self.data.free()

    def append(mut self, val: Int):
        # Update the array for demo purposes
        if self.size < self.cap:
            (self.data + self.size).init_pointee_copy(val)
            self.size += 1
        else:
            print("Out of bounds")

    def dump(self):
        # Print the array contents for demo purposes
        print("[", end="")
        for i in range(self.size):
            if i > 0:
                print(", ", end="")
            print(self.data[i], end="")
        print("]")

def main():
    var a = HeapArray(2, 1)
    var b = a.copy()  # Calls the copy method
    a.dump()  # Prints [1, 1]
    b.dump()  # Prints [1, 1]

    b.append(2)  # Changes the copied data
    b.dump()  # Prints [1, 1, 2]
    a.dump()  # Prints [1, 1] (the original did not change)