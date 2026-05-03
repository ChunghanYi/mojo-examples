# Quackable 트레잇은 구조체가 quack 메서드를 구현해야 한다는 것을 나타냅니다.
trait Quackable:
    def quack(self):
        pass

# Flyable 트레잇은 구조체가 fly 메서드를 구현해야 한다는 것을 나타냅니다.
trait Flyable:
    def fly(self): ...

# quack_and_go 함수는 Quackable과 Flyable 트레잇을 모두 만족하는 타입을 인자로 받아서,
# quack과 fly 메서드를 호출합니다.
# Trait composition을 사용하여 두 트레잇을 모두 만족하는 타입을 요구.
def quack_and_go[type: Quackable & Flyable](quacker: type):
    quacker.quack()
    quacker.fly()

@fieldwise_init
# FlyingDuck 구조체는 Quackable과 Flyable 트레잇을 모두 구현합니다.
struct FlyingDuck(Copyable, Quackable, Flyable):
    def quack(self):
        print("Quack")

    def fly(self):
        print("Whoosh!")

# main 함수에서는 FlyingDuck 구조체의 인스턴스를 생성하고,
# quack_and_go 함수를 호출하여 트레잇이 제대로 구현되었는지 확인할 수 있습니다.
def main():
    var duck = FlyingDuck()
    quack_and_go(duck)  # Output: Quack \n Whoosh!
    
