from std.memory import OwnedPointer

struct MyData(Movable): # Copyable가 아닌 Movable로 정의하여 소유권 이동이 가능하도록 합니다.
    var value: Int

    def __init__(out self, value: Int):
        self.value = value

def main():
    # OwnedPointer를 사용해 힙 메모리에 MyData를 할당하고 독점 소유권을 가집니다.
    var o_ptr = OwnedPointer(MyData(10))

    # [] 역참조 연산자를 통해 내부 데이터에 접근합니다.
    print("OwnedPointer 값:", o_ptr[].value)

    # o_ptr은 독점적 소유권을 가지므로 아래와 같이 다른 변수에 단순히 복사할 수 없습니다.
    # var o_ptr2 = o_ptr # 컴파일 에러 발생!

    # 소유권을 다른 곳으로 넘기려면 이동 연산자(^)를 사용해 소유권을 완전히 이전해야 합니다.
    var moved_ptr = o_ptr^
    print("Moved OwnedPointer 값:", moved_ptr[].value)
    # o_ptr은 이미 소유권이 이동되었으므로 더 이상 접근할 수 없습니다.
    # print(o_ptr[].value) # 컴파일 에러 발생!
    # moved_ptr이 범위를 벗어나면 MyData 인스턴스가 자동으로 파괴되고 메모리가 해제됩니다.

