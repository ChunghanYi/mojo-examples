def variables_example():
    var name: String = "Mojo" # 타입 명시 (권장)
    var age = 1 # 타입 추론 (Int로 인식됨)
    print("Age:", age)
    age = 2 # var로 선언했으므로 값 변경 가능
    comptime PI = 3.14159 # 컴파일 타임 상수
    # PI = 3.14 <- 에러 발생! (comptime은 한 번 정해지면 변경 불가)

    print("Name:", name)
    print("Age:", age)
    print("PI:", PI)

def main():
    #변수 선언과 초기화
    #명시적인 타입 지원 시 var 키워드 사용
    var greeting: String = "Hello World"
    var a: Int = 10
    var b: Float64 = 3.14
    var c: Bool = True
    print(a)
    print(b)
    print(c)
    print(greeting)

    #암시적인 타입 지원 - Python과 유사하게 타입 추론이 가능
    d = 20
    e = 2.718
    f = False
    g = "Goodbye"
    print(d)
    print(e)
    print(f)
    print(g)

    variables_example()
