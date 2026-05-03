struct MyData:
    var value: Int
    def __init__(out self, v: Int):
        self.value = v

# var를 명시하여 소유권을 완전히 넘겨받는 함수
def take_ownership(var data: MyData):
    data.value += 100
    print("새 주인이 값을 변경함:", data.value)
    # 이 함수가 끝나면 data는 메모리에서 파괴됩니다.

def main():
    var my_obj = MyData(10) # my_obj가 데이터의 최초 소유자

    # ^ (Transfer) 연산자를 사용하여 소유권을 완전히 넘김
    take_ownership(my_obj^) 

    # 컴파일 에러 발생! 
    # my_obj는 이미 소유권을 넘겨주었으므로 더 이상 접근할 수 없습니다.
    # print(my_obj.value) 