# 구조체 정의와 사용 예시
struct MyPair:
    var first: Int
    var second: Int

    # 구조체의 필드를 초기화하는 생성자 메서드
    def __init__(out self, first: Int, second: Int):
        self.first = first
        self.second = second

# @fieldwise_init 데코레이터를 사용하여 구조체의 필드를 자동으로 초기화하는 예시
@fieldwise_init
struct MyPair2:
    var first: Int
    var second: Int

def main() raises:
    # MyPair 구조체의 인스턴스를 생성하고 필드에 접근하는 예시
    pair = MyPair(1, 2)
    print("First:", pair.first)
    print("Second:", pair.second)

    # MyPair2는 @fieldwise_init 덕분에 생성자 메서드를 명시적으로 정의하지 않아도 됩니다.
    pair2 = MyPair2(1, 2)
    print("First:", pair2.first)
    print("Second:", pair2.second)

