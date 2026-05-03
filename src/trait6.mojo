struct Container(ImplicitlyCopyable):
    var data: Int

    def __init__(out self, data: Int):
        self.data = data

    # Define how the copy is made
    def __init__(out self, existing: Self):
        self.data = existing.data

def main():
    var a = Container(10)
    var b = a # Uses __init__ for deep copy
    
    print(a.data) # 10
    print(b.data) # 10
