from std.memory.pointer import Pointer

struct MyStruct:
    var val: Int

    def __init__(out self, val: Int):
        self.val = val

def main():
    # 1. 일반적인 값 생성 (Mojo가 수명을 관리함)
    var my_instance = MyStruct(42)

    # 2. 존재하는 값으로부터 Pointer 생성 (to= 키워드 사용)
    # 안전한 Pointer는 빈 공간(Null)이나 할당되지 않은 메모리를 가리킬 수 없습니다.
    var safe_ptr = Pointer(to=my_instance) 

    # 3. 포인터 역참조(Dereference)를 위해 [] 연산자 사용
    print("포인터가 가리키는 값:", safe_ptr[].val) # 출력: 42

    # 안전성 보장: 
    # my_instance 원본 값의 수명은 safe_ptr이 코드에서 사용되는 동안 
    # Mojo 컴파일러에 의해 자동으로 유효하게 연장됩니다.
