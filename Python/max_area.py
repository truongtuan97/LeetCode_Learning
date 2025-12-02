def maxArea(height):
    n = len(height)
    maxArea = 0
    minHeight = height[0]
    left, right = 0, n - 1
    while left < right:
        minHeight = min(height[left], height[right])
        maxArea = max(maxArea, ((right - left) * minHeight))
        if height[left] < height[right]:
            left += 1
        else:
            right -= 1
    return maxArea


def maxArea_Brutforce(height):
    maxArea = 0
    n = len(height)
    minHeight = height[0]

    for i in range(n):
        for j in range(i + 1, n):
            minHeight = min(height[i], height[j])
            maxArea = max(maxArea, (j - i) * minHeight)
    return maxArea


# ===== VÍ DỤ SỬ DỤNG =====

print("=" * 70)
print("VÍ DỤ 1:")
print("=" * 70)
height1 = [1, 8, 6, 2, 5, 4, 8, 3, 7]
print(f"Input:  {height1}")
result1 = maxArea(height1)
print(f"Output: {result1}")
print("Giải thích: Chọn đường thứ 2 (cao=8) và đường thứ 9 (cao=7)")
print("           Diện tích = (9-2) * min(8,7) = 7 * 7 = 49\n")

print("=" * 70)
print("VÍ DỤ 2:")
print("=" * 70)
height2 = [1, 1]
print(f"Input:  {height2}")
result2 = maxArea(height2)
print(f"Output: {result2}")
print("Giải thích: Chỉ có 2 đường, diện tích = 1 * 1 = 1\n")

print("=" * 70)
print("VÍ DỤ 3:")
print("=" * 70)
height3 = [4, 3, 2, 1, 4]
print(f"Input:  {height3}")
result3 = maxArea(height3)
print(f"Output: {result3}")
print("Giải thích: Chọn đường đầu (cao=4) và đường cuối (cao=4)")
print("           Diện tích = (5-1) * min(4,4) = 4 * 4 = 16\n")

print("=" * 70)
print("VÍ DỤ 4:")
print("=" * 70)
height4 = [1, 2, 1]
print(f"Input:  {height4}")
result4 = maxArea(height4)
print(f"Output: {result4}")
print("Giải thích: Chọn đường đầu (cao=1) và đường cuối (cao=1)")
print("           Diện tích = (3-1) * min(1,1) = 2 * 1 = 2\n")


# ===== SO SÁNH CÁC PHƯƠNG PHÁP =====
print("=" * 70)
print("SO SÁNH CÁC PHƯƠNG PHÁP:")
print("=" * 70)
test = [1, 8, 6, 2, 5, 4, 8, 3, 7]
print(f"Input: {test}\n")
print(f"Method 1 (Two Pointers): {maxArea(test)}")
print(f"Method 3 (Brute Force):  {maxArea_Brutforce(test)}")
