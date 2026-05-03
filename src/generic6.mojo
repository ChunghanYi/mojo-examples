comptime BaseTraits = Copyable & ImplicitlyDestructible

@fieldwise_init
struct Wrapper[T: BaseTraits](
    Writable where conforms_to(T, Writable),
    Boolable where conforms_to(T, Boolable), # New conditional conformance
    ):
    var value: Self.T

    # New method
    def __bool__(self) -> Bool where conforms_to(Self.T, Boolable):
        return trait_downcast[Boolable](self.value).__bool__()

def main():
    var w_str = Wrapper[String]("Hello")
    if w_str:  # Chooses the non-empty branch
        print(t"Non-empty string \"{w_str.value}\" is truthy")
    else:
        print(t"Empty string \"{w_str.value}\" is falsy")

    var w_empty_str = Wrapper[String]("")
    if w_empty_str:  # Chooses the empty branch
        print(t"Non-empty string \"{w_empty_str.value}\" is truthy")
    else:
        print(t"Empty string \"{w_empty_str.value}\" is falsy")