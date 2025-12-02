"""
Tìm tất cả bộ 3 số có tổng bằng 0 (không trùng lặp)

Args:
    nums: List các số nguyên

Returns:
    List các bộ 3 số [a, b, c] sao cho a + b + c = 0
"""


def threeSum(nums):
    results = []
    nums.sort()
    n = len(nums)

    for i in range(n - 2):
        if i > 0 and nums[i - 1] == nums[i]:
            continue
        left = i + 1
        right = n - 1
        while left < right:
            sum = nums[i] + nums[left] + nums[right]
            if sum == 0:
                results.append([nums[i], nums[left], nums[right]])
                while left < right and nums[left + 1] == nums[left]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1
            elif sum < 0:
                left += 1
            else:
                right -= 1
    return results


def three_sum_brutforce(nums):
    results = []

    for i in range(0, len(nums) - 2):
        for j in range(1, len(nums) - 1):
            for k in range(2, len(nums)):
                total = nums[i] + nums[j] + nums[k]
                if total == 0:
                    tripple = [nums[i], nums[j], nums[k]]
                    if tripple not in results:
                        results.append(tripple)

    results


# ===== VÍ DỤ SỬ DỤNG =====

print("=" * 70)
print("VÍ DỤ TREE SUM WITH BRUTFORCE:")
print("=" * 70)
nums = [-1, 0, 1, 2, -1, -4]
print(f"Input:  {nums}")
result = three_sum_brutforce(nums)
print(f"Output: {result}")
print("Giải thích:")
print("  • [-1, -1, 2]: -1 + (-1) + 2 = 0")
print("  • [-1, 0, 1]:  -1 + 0 + 1 = 0\n")


print("=" * 70)
print("VÍ DỤ 1:")
print("=" * 70)
nums1 = [-1, 0, 1, 2, -1, -4]
print(f"Input:  {nums1}")
result1 = threeSum(nums1)
print(f"Output: {result1}")
print("Giải thích:")
print("  • [-1, -1, 2]: -1 + (-1) + 2 = 0")
print("  • [-1, 0, 1]:  -1 + 0 + 1 = 0\n")

print("=" * 70)
print("VÍ DỤ 2: Không có kết quả")
print("=" * 70)
nums2 = [0, 1, 1]
print(f"Input:  {nums2}")
result2 = threeSum(nums2)
print(f"Output: {result2}")
print("Giải thích: Không có bộ 3 nào có tổng = 0\n")

print("=" * 70)
print("VÍ DỤ 3: Tất cả số 0")
print("=" * 70)
nums3 = [0, 0, 0]
print(f"Input:  {nums3}")
result3 = threeSum(nums3)
print(f"Output: {result3}")
print("Giải thích: 0 + 0 + 0 = 0\n")

print("=" * 70)
print("VÍ DỤ 4: Nhiều kết quả")
print("=" * 70)
nums4 = [-2, 0, 1, 1, 2]
print(f"Input:  {nums4}")
result4 = threeSum(nums4)
print(f"Output: {result4}")
print("Giải thích:")
for triplet in result4:
    print(f"  • {triplet}: {triplet[0]} + {triplet[1]} + {triplet[2]} = 0")
print()

print("=" * 70)
print("VÍ DỤ 5: Có duplicate")
print("=" * 70)
nums5 = [-1, 0, 1, 0]
print(f"Input:  {nums5}")
result5 = threeSum(nums5)
print(f"Output: {result5}")
print("Giải thích: Chỉ có 1 bộ duy nhất [-1, 0, 1]\n")
