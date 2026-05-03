@fieldwise_init
# ExampleStruct 구조체는 제네릭 타입과 매개변수를 사용하여
# 다양한 타입과 값을 처리할 수 있습니다.
struct ExampleStruct:
    def example[
        T: Writable & Copyable,   # type parameter(trait bounds)
        count: Int,               # value parameter
    ](
        self,
        data: String,             # argument
        init_value: T             # generic argument
    ) -> String:
        # Example logic using the generic type and parameters
        var result = ""
        for _ in range(count):
            result += String(data) + " " + String(init_value) + "|"
        return result

# main 함수에서는 ExampleStruct의 인스턴스를 생성하고,
# example 메서드를 호출하여 제네릭 타입과 매개변수가 제대로 작동하는지 확인할 수 있습니다.
def main():
    var ex = ExampleStruct()
    var result = ex.example[Int, 5]("Hello", 42)
    print(result)

