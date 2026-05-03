# T는 "뭔지 모르겠지만 어떤 타입"을 의미합니다.
# AnyType은 "아무 타입이나 다 올 수 있다"는 가장 기본적인 제약 조건입니다.
# Writable은 "값을 출력할 수 있다"는 제약 조건입니다.
def print_twice[T: Writable](val: T):
    # 컴파일러가 T에 무엇이 들어올지 나중에 알아서 채워 넣습니다.
    print(val, val) # Writable 트레잇이 구현된 타입은 print 함수에서 사용할 수 있습니다.

def main():
    # 사용할 때는 어떤 타입을 쓸지 꺾쇠[]나 인자를 통해 알려줍니다.
    print_twice[Int](10) # T가 Int로 변신!
    print_twice[String]("Hi") # T가 String으로 변신!
    print_twice(3.14) # T가 Float로 변신! (컴파일러가 알아서 추론)
    print_twice("Hello") # T가 String으로 변신! (컴파일러가 알아서 추론)
    print_twice(True) # T가 Bool로 변신! (컴파일러가 알아서 추론)


