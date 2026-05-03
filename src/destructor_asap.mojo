@fieldwise_init
struct Balloon(Writable):
    var color: String

    # write_to 메서드는 self를 mutable로 받아서 구조체의 필드를 읽어와서 writer에 쓸 수 있습니다.
    def write_to(self, mut writer: Some[Writer]):
        writer.write(String("a ", self.color, " balloon"))

    # __del__ 메서드는 self를 deinit으로 받아서 구조체가 소멸될 때 실행되는 코드를 정의할 수 있습니다.
    def __del__(deinit self):
        print("Destroyed", String(self.color))


# main 함수에서는 Balloon 구조체의 인스턴스를 생성하고,
# 이를 출력하여 __del__ 메서드가 언제 호출되는지 확인할 수 있습니다.
def main():
    var a = Balloon("red")
    var b = Balloon("blue")
    print(a)
    # a.__del__() runs here for "red" Balloon

    a = Balloon("green")
    print(a)
    # a.__del__() runs immediately because "green" Balloon is never used

    print(b)
    # b.__del__() runs here

