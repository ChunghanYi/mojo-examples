@fieldwise_init
struct MyPet(Copyable):
    var name: String
    var age: Int

def main():
    var mine = MyPet("Loki", 4)
    var yours = mine.copy()
    print(yours.name)  # Output: Loki
    print(yours.age)   # Output: 4