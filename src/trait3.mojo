# 괄호 안에 "나는 Copyable과 Movable 계약을 따르겠다"고 선언합니다.
#struct MyData(Copyable, ImplicitlyCopyable, Movable):
struct MyData(ImplicitlyCopyable, Movable):
#struct MyData(Copyable, Movable):
    var value: Int
    var str: String

    # 기본 생성자
    def __init__(out self, v: Int, s: String):
        self.value = v
        self.str = s

def main():
    var a = MyData(10, "Hello, World!")

    # 1. ImplicitlyCopyable 덕분에 가능해진 작업
    var b = a # 여기서 내부적으로 def __init__(out self,*, copy: Self)가 자동 호출됨 
    print("a.value:", a.value)  # Output: a.value: 10
    print("b.value:", b.value)  # Output: b.value: 10
    print("a.str:", a.str)  # Output: a.str: Hello, World!
    print("b.str:", b.str)  # Output: b.str: Hello, World!

    # 2. Copyable(혹은 ImplicitlyCopyable) 덕분에 가능해진 작업
    var c = a.copy() # 명시적으로 copy 메서드 호출
    print("a.value:", a.value)
    print("c.value:", c.value)  # Output: c.value: 10
    print("a.str:", a.str)  # Output: a.str: Hello, World!
    print("c.str:", c.str)  # Output: c.str: Hello, World!

    # 3. Movable 덕분에 가능해진 작업
    var d = a^ # 여기서 내부적으로 def __init__(out self, *, deinit take: Self)가 자동 호출됨
    print("d.value:", d.value)  # Output: d.value: 10
    print("d.str:", d.str)  # Output: d.str: Hello, World!
    # print("a.value:", a.value)  # 컴파일 에러 발생! a는 이미 이동되었으므로 접근 불가 


