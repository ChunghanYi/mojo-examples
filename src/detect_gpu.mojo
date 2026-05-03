from std.sys import has_accelerator

# GPU 가속기 존재 여부를 확인하는 간단한 예제입니다.
def main():
    comptime if has_accelerator():  # GPU 가속기가 감지되면
        print("GPU detected")
        # Enable GPU processing
    else:
        print("No GPU detected")
        # Print error or fall back to CPU-only execution


