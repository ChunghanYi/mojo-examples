struct SizedListWrapper[capacity: Int, T: Copyable & Writable](
    Sized, Writable where conforms_to(T, Writable) and capacity > 0
):
    var data: List[Self.T]

    def __init__(out self, value: Self.T):
        self.data = List[Self.T](capacity=Self.capacity)
        for _ in range(Self.capacity):
            self.data.append(value.copy())

    def __len__(self) -> Int:
        return len(self.data)

    def write_to(self, mut writer: Some[Writer]):
        #writer.write(repr(self.data))
        var s = "["
        for i in range(len(self.data)):
            s += String(self.data[i])
            if i < len(self.data) - 1: s += ", "
        s += "]"
        writer.write(s)

def main():
    var wrapper = SizedListWrapper[3, Int](42)
    print(wrapper)  # SizedListWrapper[capacity=3, data=[42, 42, 42]]
    print(len(wrapper))  # Output: 3
