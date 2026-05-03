@fieldwise_init
# Point 구조체는 Writable 트레잇을 구현하여,
# write_to 메서드를 통해 자신의 데이터를 출력할 수 있습니다.
struct Point(Writable):
    var x: Float64
    var y: Float64

    # write_to 메서드는 self를 mutable로 받아서 구조체의 필드를 읽어와서
    # writer에 쓸 수 있습니다.
    def write_to(self, mut writer: Some[Writer]):
        writer.write(t"Point({self.x}, {self.y})")

# main 함수에서는 Point 구조체의 인스턴스를 생성하고,
# 이를 출력하여 write_to 메서드가 제대로 작동하는지 확인할 수 있습니다
def main():
    var p = Point(1.5, 2.7)
    print(p)  # Point(1.5, 2.7)

