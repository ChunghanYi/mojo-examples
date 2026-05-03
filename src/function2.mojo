# v0.26.x 기준 최신 문법
def my_function(
    a: String,        # 1. 생략됨: 기본적으로 'read' (읽기 전용)로 동작
    read b: String,   # 2. 명시적 표기: 위 a와 100% 동일하게 동작함
    mut c: String,    # 3. 원본 수정: 반드시 'mut' 명시 필요
    var d: String,    # 4. 소유권 획득: 반드시 'var' 명시 필요
    var e: String     # 5. 소유권 획득 + 원본 수정: 반드시 'var' 명시 필요
):
    # a += "!"  <- 컴파일 에러! (기본적으로 수정 불가)
    # b += "!"  <- 컴파일 에러! (읽기 전용)
    
    c += " world"    # 성공: 넘겨받은 원본 문자열 데이터 자체가 변경됨
    d += " world"    # 성공: 나만의 소유/복사본이므로 마음대로 변경 가능 (원본은 영향 없거나 파괴됨)
    e += " world"    # 성공: 나만의 소유/복사본이므로 마음대로 변경 가능 (원본은 영향 없거나 파괴됨)

def main():
    original1 = "Hello1"
    original2 = "Hello2"
    original3 = "Hello3"
    original4 = "Hello4"
    original5 = "Hello5"
    my_function(original1, original2, original3, original4, original5^)

    # 원본은 변경되지 않음 (a는 읽기 전용)
    print("Original after function call:", original1)
    # 원본은 변경되지 않음 (b는 읽기 전용)
    print("Original after function call:", original2)
    # 원본이 수정됨 (c는 원본이므로)
    print("Original after function call:", original3)
    # 원본이 변경되지 않음 (d는 소유권 획득하여 복사본이므로)
    print("Original after function call:", original4)
    # 원본의 소유권이 이동하여 더 이상 접근 불가
    #print("Original after function call:", original5) 

