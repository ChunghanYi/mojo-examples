from std.collections import List
# Python과의 상호 운용을 위한 모듈 임포트
from std.python import Python

# for-else 구문과 Python 리스트 순회 예시
def main() raises:
    # for-else 구문 예시
    var empty: List[Int] = []
    for i in empty:
        print(i)
    else:
        print("Finished executing 'for' loop")

    # for-else 구문에서 else 블록은 루프가 정상적으로 종료될 때 실행됩니다.
    # 루프가 break로 중단되면 else 블록은 실행되지 않습니다.
    animals = ["cat", "aardvark", "hippopotamus", "dog"]
    for animal in animals:
        if animal == "dog":
            print("Found a dog")
            break
    else:
        print("No dog found")

    # Mojo의 리스트는 단일 타입만 허용하지만, Python 리스트는 다양한 타입을 포함할 수 있습니다.
    py_list = Python.list(42, "cat", 3.14159)
    for py_obj in py_list:  # Each element is of type "PythonObject"
        print(py_obj)

    # Python 딕셔너리 순회 예시
    py_dict = Python.evaluate("{'a': 1, 'b': 2.71828, 'c': 'sushi'}")
    for py_key in py_dict:  # Each key is of type "PythonObject"
        print(py_key, py_dict[py_key])

    # Python 딕셔너리 순회 예시 (items() 사용)
    py_dict = Python.evaluate("{'a': 1, 'b': 2.71828, 'c': 'sushi'}")
    for py_tuple in py_dict.items():  # Each 2-tuple is of type "PythonObject"
        print(py_tuple[0], py_tuple[1])

