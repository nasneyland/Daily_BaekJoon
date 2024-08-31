def solution(k, d):
    ans = 0
    for i in range(0, d + 1, k):
        max_j = int((d ** 2 - i ** 2) ** 0.5)
        ans += (max_j // k) + 1
    return ans
