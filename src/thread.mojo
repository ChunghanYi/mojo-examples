from std.algorithm import parallelize

@parameter
def worker(i: Int):  # i는 0부터 9까지의 정수로, 각 병렬 작업에서 고유하게 전달됩니다.
    print("Index at worker:", i)

def main():
    # parallelize는 각 작업(worker)에 고유한 인덱스(i)를 전달하여 병렬로 실행합니다.
    parallelize[worker](10)
    
    print("All parallel works are complete.")
