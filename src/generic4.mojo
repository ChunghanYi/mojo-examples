# BaseTraits라는 새로운 컴파일 타임 타입 제약 조건을 정의합니다.
comptime BaseTraits = Copyable & ImplicitlyDestructible 

@fieldwise_init
struct Wrapper[T: BaseTraits]( # T라는 BaseTraits 제약 조건을 만족하는 어떤 타입
    Writable where conforms_to(T, Writable) 
    # Writable 트레잇을 만족하는 타입에 대해서만 Wrapper가 Writable이 될 수 있도록 제약 조건 추가
):
    var value: Self.T

@fieldwise_init
struct NotWritable(BaseTraits):
    var data: Int

# main 함수에서는 Wrapper와 NotWritable 구조체의 인스턴스를 생성하여
# 제네릭 타입과 트레잇 제약 조건이 제대로 작동하는지 확인할 수 있습니다.
def main():
    var w_int = Wrapper[Int](42)  # Int is Writable
    print(w_int)  # Wrapper[Int](value=42)


    var w_str = Wrapper[String]("Hello")  # String is Writable
    print(w_str)  # Wrapper[String](value=Hello)

    # 컴파일 에러 발생! NotWritable은 Writable이 아니므로 Wrapper의 T로 사용할 수 없습니다.
    #var w_not_writable = Wrapper[NotWritable](NotWritable(10)) 
        
    _ = Wrapper[NotWritable](NotWritable(10))
    # print(w_not_writable)  # Compile-time error:

