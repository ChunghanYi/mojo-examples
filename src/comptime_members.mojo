@fieldwise_init
struct Sentiment(Equatable, ImplicitlyCopyable):
    var _value: Int

    comptime NEGATIVE = Sentiment(0)
    comptime NEUTRAL = Sentiment(1)
    comptime POSITIVE = Sentiment(2)

    def __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

def is_happy(s: Sentiment):
    if s == Sentiment.POSITIVE:
        print("Yes. 😀")
    else:
        print("No. ☹️")

def main():
    is_happy(Sentiment.POSITIVE)

    