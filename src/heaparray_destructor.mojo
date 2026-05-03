struct HeapArray(Writable):
    var data: UnsafePointer[Int, MutExternalOrigin]
    var size: Int

    def __init__(out self, *values: Int):
        self.size = len(values)
        self.data = alloc[Int](self.size)
        for i in range(self.size):
            (self.data + i).init_pointee_copy(values[i])

    def write_to(self, mut writer: Some[Writer]):
        writer.write("[")
        for i in range(self.size):
            writer.write(self.data[i])
            if i < self.size - 1:
                writer.write(", ")
        writer.write("]")

    def __del__(deinit self):
        print("Destroying", self.size, "elements")
        for i in range(self.size):
            (self.data + i).destroy_pointee()
        self.data.free()


def main():
    var a = HeapArray(10, 1, 3, 9)
    print(a)