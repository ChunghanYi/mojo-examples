struct GenericArray[ElementType: Copyable & ImplicitlyDestructible]:
    var data: UnsafePointer[Self.ElementType, MutExternalOrigin]
    var size: Int

    def __init__(out self, var *elements: Self.ElementType):
        self.size = len(elements)
        self.data = alloc[Self.ElementType](self.size)
        for i in range(self.size):
            (self.data + i).init_pointee_move(elements[i].copy())

    def __del__(deinit self):
        for i in range(self.size):
            (self.data + i).destroy_pointee()
        self.data.free()

    def __getitem__(self, i: Int) raises -> ref[self] Self.ElementType:
        if i < self.size:
            return self.data[i]
        else:
            raise Error("Out of bounds")

def main() raises:
    var array = GenericArray(1, 2, 3, 4)
    for i in range(array.size):
        end = ", " if i < array.size - 1 else "\n"
        print(array[i], end=end)

    