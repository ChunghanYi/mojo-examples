#from std.memory import UnsafePointer
from std.memory import alloc

def main():
    # 1. 힙 메모리 할당 (Int 타입 데이터 3개가 들어갈 공간)
    # Mojo 컴파일러가 관리해주지 않으므로, 개발자가 직접 메모리를 확보(alloc)합니다.
    #var ptr = UnsafePointer[Int].alloc(3)
    var ptr = alloc[Int](3)

    # 2. 포인터 연산 및 메모리 초기화
    # 메모리의 경계(Bounds)를 검사하지 않으므로 C++ 수준의 최고 성능을 냅니다.
    (ptr + 0)[] = 10 # 포인터 오프셋 덧셈 연산을 통한 접근
    ptr[1] = 20 # 배열처럼 대괄호 인덱싱을 통한 접근
    ptr[2] = 30

    print(ptr[0], ptr[1], ptr[2]) # 출력: 10 20 30

    # 3. 메모리 수동 해제 (가장 중요!)
    # alloc()으로 할당한 메모리는 자동으로 파괴되지 않습니다. 
    # 사용이 끝나면 반드시 free()를 호출해야 메모리 누수(Leak)가 발생하지 않습니다.
    ptr.free()

    # --- 참고: 스택(Stack)의 지역 변수를 UnsafePointer로 가리키기 ---
    var number = 100
    var ptr_to_number = UnsafePointer(to=number)
    print(ptr_to_number[]) # 출력: 100
    # 이 경우 힙 메모리를 직접 할당(alloc)한 것이 아니므로 .free()를 호출하면 안 됩니다!