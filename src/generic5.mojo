comptime BaseTraits = Copyable & ImplicitlyDestructible

@fieldwise_init
struct Pair[L: BaseTraits, R: BaseTraits](
    Hashable where conforms_to(L, Hashable) and conforms_to(R, Hashable)
):
    var left: Self.L
    var right: Self.R

@fieldwise_init
struct NotHashable(BaseTraits):
    var data: Int

def main():
    var pair = Pair[Int, String](left=1, right="one")
    var hash = hash(pair)
    print(hash)  # Prints the hash of the pair

    # OK: only hashing is unavailable
    #var pair2 = Pair[Int, NotHashable](left=1, right=NotHashable(10)) # Constructible
    _ = Pair[Int, NotHashable](left=1, right=NotHashable(10)) # Constructible
    # var hash2 = hash(pair2) # Compile time error