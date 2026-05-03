# 매개변수 타입(Int)과 반환 타입(-> Int)이 명시된 함수
def add_numbers(a: Int, b: Int) -> Int:
    var result = a + b
    return result

# 매개변수 타입(String)과 반환 타입(None)이 명시된 함수
def greet(name: String) -> None:
    print("Hello,", name)

# 매개변수 타입(Int)과 반환 타입(Int)이 명시된 함수, exp는 기본값 2로 설정
def my_pow(base: Int, exp: Int = 2) -> Int:
    return base ** exp

# 가변 인자(*values: Int)와 반환 타입(Int)이 명시된 함수
def sum(*values: Int) -> Int:
    var sum: Int = 0
    for value in values:
        sum = sum + value
    return sum

# main 함수에서 위에서 정의한 함수를 호출하여 결과를 출력
def main():
    sum_result = add_numbers(5, 7)
    print("Sum:", sum_result)

    greet("Mojo")

    # 기본값을 사용하여 제곱 계산
    var z = my_pow(3)
    print(z)

    # 키워드 인수 사용 예시
    z = my_pow(exp=3, base=2)
    print(z)

    sum_all = sum(1, 2, 3, 4, 5)
    print("Sum of all:", sum_all)