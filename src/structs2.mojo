@fieldwise_init
struct MyStruct:
    var value: Int

    # increment 메서드는 self를 mutable로 받아서 구조체의 필드를 수정할 수 있습니다.
    def increment(mut self):
        self.value += 1

@fieldwise_init
struct MyPair(ImplicitlyCopyable):
    var first: Int
    var second: Int
    
def main():
    # 1) MyStruct의 인스턴스를 생성하고 increment 메서드를 호출하여
    # value 필드가 증가하는 것을 확인하는 예시
    var s: MyStruct = MyStruct(10)
    print("Before increment:", s.value) # Output: 10
    s.increment()
    print("After increment:", s.value)  # Output: 11

    # 2) MyPair 구조체의 인스턴스를 생성하고 필드에 접근하는 예시
    var a = MyPair(1, 2)
    print("Original MyPair:", a.first, a.second) # Output: 1 2

    # Implicit copy(암묵적인 복사)
    var b = a  # value of type 'MyPair' cannot be implicitly copied,
            # it does not conform to 'ImplicitlyCopyable'
    print("Copied MyPair:", b.first, b.second) # Output: 1 2

    # Explicit copy(명시적인 복사)
    var c = a.copy()  # value of type 'MyPair' cannot be implicitly copied,
            # it does not conform to 'ImplicitlyCopyable'
    print("Explicitly Copied MyPair:", c.first, c.second) # Output: 1 2

    # Move (이동)
    var d = a^  # value of type 'MyPair' cannot be copied or moved; consider
                # conforming it to 'Copyable', which also adds 'Movable'
                # conformance.
    print("Moved MyPair:", d.first, d.second) # Output: 1 2

