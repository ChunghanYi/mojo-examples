# MyCollectionElement라는 새로운 컴파일 타임 타입 제약 조건을 정의합니다.
comptime MyCollectionElement = ImplicitlyCopyable & ImplicitlyDestructible 

# T라는 ImplicitlyCopyable & ImplicitlyDestructible 제약 조건을 만족하는
# 어떤 타입이든 들어올 수 있는 함수
def make_filled[T: MyCollectionElement, size: Int](
    splat_value: T
) -> List[T]:
    var result = List[T](capacity=size) # 컴파일 타임에 크기가 결정되는 리스트 생성
    for _ in range(size): # 컴파일 타임 루프를 사용하여 리스트를 채웁니다.
        result.append(splat_value)
    return result^  # 리스트를 반환할 때 이동하여 반환합니다.

# main 함수에서는 make_filled 함수를 호출하여 제네릭 타입과
# 매개변수가 제대로 작동하는지 확인할 수 있습니다.
def main():
    var three_zeros = make_filled[Int, 3](100)
    var five_hellos = make_filled[String, 5]("hello")
    print(three_zeros)  # [100, 100, 100]
    print(five_hellos)  # [hello, hello, hello, hello, hello]
    
    
