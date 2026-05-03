from std.collections import Set

# 리스트, 집합, 딕셔너리 등 다양한 컬렉션 타입에서 for 루프 사용 가능
def main() raises:
    # 리스트 예시
    states = ["California", "Hawaii", "Oregon"]
    for state in states:
        print(state)

    # 집합 예시
    values = {42, 0}
    for item in values:
        print(item)

    # 딕셔너리 예시
    var capitals: Dict[String, String] = {
        "California": "Sacramento",
        "Hawaii": "Honolulu",
        "Oregon": "Salem"
    }

    # 딕셔너리에서 키를 순회
    for var state in capitals:
        print(capitals[state] + ", " + state)

    # 딕셔너리에서 키와 값을 동시에 순회
    for item in capitals.items():
        print(item.value + ", " + item.key)

    