# comptime 키워드를 사용하여 컴파일 타임 상수를 선언할 수 있습니다.
# 컴파일 타임 상수는 프로그램이 컴파일될 때 값이 결정되고,
# 런타임에는 변경할 수 없는 값을 의미합니다.
comptime VALUE = 10

def scope_me():
    print(VALUE)  # prints 10
    comptime VALUE = 20
    # comptime VALUE = 30  # error: invalid redeclaration of VALUE
    comptime if True:
        comptime VALUE = 40
        print(VALUE)  # prints 40
    print(VALUE)  # prints 20

def main():
    scope_me()

