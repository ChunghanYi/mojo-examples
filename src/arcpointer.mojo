from std.memory import ArcPointer

# ArcPointer는 참조 카운팅을 사용하여 메모리를 관리하므로,
# MySharedData는 Copyable로 정의되어야 합니다.
struct MySharedData(Copyable):  
    var value: Int

    def __init__(out self, value: Int):
        self.value = value

def main():
    # ArcPointer를 초기화하면 힙 메모리가 할당되고 참조 카운트가 1이 됩니다.
    var arc_ptr1 = ArcPointer(MySharedData(100))

    # ArcPointer는 복사가 가능합니다. 이 변수가 복사되면 참조 카운트가 2로 증가합니다.
    var arc_ptr2 = arc_ptr1 

    # 두 스마트 포인터 모두 동일한 힙 메모리의 데이터를 안전하게 공유하며 참조합니다.
    print("ArcPointer 1 값:", arc_ptr1[].value)
    print("ArcPointer 2 값:", arc_ptr2[].value)

    # 함수가 종료되며 arc_ptr1과 arc_ptr2가 모두 파괴되면 참조 카운트가 0이 되어 메모리가 해제됩니다

