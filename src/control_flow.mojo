# 제어 흐름 예시: 조건문과 반복문
def main() raises:
    temp_celsius = Float64(25)
    # 조건문 예시
    if temp_celsius > 20:
        print("It is warm.")
        print("The temperature is", temp_celsius * 9 / 5 + 32, "Fahrenheit." )
    
    # elif와 else 예시
    temp_celsius = 25
    if temp_celsius <= 0:
        print("It is freezing.")
    elif temp_celsius < 20:
        print("It is cool.")
    elif temp_celsius < 30:
        print("It is warm.")
    else:
        print("It is hot.")

    # 삼항 연산자 예시
    temp_celsius = 15
    forecast = "warm" if temp_celsius > 20 else "cool"
    print("The forecast for today is", forecast)

    # 반복문 예시: 피보나치 수열 출력
    fib_prev = 0
    fib_curr = 1

    print(fib_prev, end="")
    while fib_curr < 50:
        print(",", fib_curr, end="")
        fib_prev, fib_curr = fib_curr, fib_prev + fib_curr
    print()

