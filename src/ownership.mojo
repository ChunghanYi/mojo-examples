# read 키워드(생략 가능)는 함수 매개변수에서 사용되어 해당 매개변수가
# 읽기 전용임을 나타냅니다. 즉, 함수 내에서 해당 매개변수의 값을 변경할 수 없습니다.
def print_list(read list: List[Int]):
    for item in list:
        print(item)
    print()

# mut 키워드는 함수 매개변수에서 사용되어 해당 매개변수가 
# 가리키는 원본 데이터를 수정할 수 있음을 나타냅니다.
def mutate(mut l: List[Int]):
    l.append(5)

# var 키워드는 함수 매개변수에서 사용되어 해당 매개변수의 소유권을 획득하여
# 복사본을 만들어 함수 내에서 자유롭게 수정할 수 있음을 나타냅니다
def take_text(var text: String):
    text += "!"
    print(text)

def main():
    var values = [1, 2, 3, 4]
    print_list(values)

    mutate(values)
    print_list(values)

    var message = "Hello"  # Create a run-time String value
    take_text(message) # message의 소유권을 이동하지 않고 그냥 전달
    print(message)

    message = "Hello"  # Create a run-time String value
    take_text(message^) # ^를 붙여서 message의 소유권을 이동
    #print(message)  # error: use of uninitialized value 'message'

