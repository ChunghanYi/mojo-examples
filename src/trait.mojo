# 트레이트는 구조체가 특정 행동을 구현하도록 강제하는 일종의 인터페이스입니다.
trait Quackable:
    def quack(self):
        pass


@fieldwise_init
# Copyable 트레이트는 구조체가 복사 가능하다는 것을 나타냅니다.
# Quackable 트레이트는 구조체가 quack 메서드를 구현해야 한다는 것을 나타냅니다.
struct Duck(Copyable, Quackable):
    def quack(self):
        print("Quack")

@fieldwise_init
struct StealthCow(Copyable, Quackable):
    def quack(self):
        print("Moo!")

# main 함수에서는 Duck과 StealthCow 구조체의 인스턴스를 생성하고,
# quack 메서드를 호출하여 트레이트가 제대로 구현되었는지 확인할 수 있습니다.
def main():
    var duck = Duck()
    var cow = StealthCow()
    duck.quack()  # Output: Quack
    cow.quack()   # Output: Moo!
