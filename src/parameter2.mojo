def repeat[MsgType: Writable, //, count: Int](msg: MsgType):
    comptime for _ in range(count):
        print(msg)

def main():
    repeat[2](42)  # prints 42 on two lines