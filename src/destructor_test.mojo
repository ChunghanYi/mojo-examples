@fieldwise_init
struct Contact:
    var name: String
    var email: String

    def __del__(deinit self):
        # `self` is initialized
        print("destroying contact")
        # `self is deinitialized

def main():
    var me = Contact("Alice", "alice@example.com")
    # Last use of `me` (and end of scope)
    # Prints "destroying contact" along with a warning
    print(me.name)
    print(me.email)
    # since the instance was never used after assignment.