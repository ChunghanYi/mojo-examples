@fieldwise_init
struct MyPet(Copyable):
    var name: String
    var age: Int

def moves():
    var a = MyPet("bobo", 2)

    print(a.name) # Prints "bobo"

    var b = a^ # the lifetime of `a` ends here

    print(b.name) # prints "bobo"
    #print(a.name)  # ERROR: use of uninitialized value 'a'

def main():
    moves()