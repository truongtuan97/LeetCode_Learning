def two_sum(nums, target):
    """
    Tim 2 so trong mang co tong bang target
    Args:
        nums: list cac so nguyen
        target: so nguyen target
    Return:
        List chua 2 chi so cua cac phan tu co tong bang target
    """
    # su dung hash map de luu gia tri va chi so
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    []


def two_sum_brute_force(nums, target):
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    []


# ===== VÍ DỤ SỬ DỤNG =====
# Ví dụ 1
nums1 = [2, 7, 11, 15]
target1 = 9
result1 = two_sum(nums1, target1)
print(f"Input: nums = {nums1}, target = {target1}")
print(f"Output: {result1}")
print(
    f"Giải thích: nums[{result1[0]}] + nums[{result1[1]}] = {nums1[result1[0]]} + {nums1[result1[1]]} = {target1}\n"
)

# Ví dụ 2
nums2 = [3, 2, 4]
target2 = 6
result2 = two_sum(nums2, target2)
print(f"Input: nums = {nums2}, target = {target2}")
print(f"Output: {result2}")
print(
    f"Giải thích: nums[{result2[0]}] + nums[{result2[1]}] = {nums2[result2[0]]} + {nums2[result2[1]]} = {target2}\n"
)

# Ví dụ 3
nums3 = [3, 3]
target3 = 6
result3 = two_sum(nums3, target3)
print(f"Input: nums = {nums3}, target = {target3}")
print(f"Output: {result3}")
print(
    f"Giải thích: nums[{result3[0]}] + nums[{result3[1]}] = {nums3[result3[0]]} + {nums3[result3[1]]} = {target3}"
)

# Ví dụ with brute force
print("*" * 70)
print("Two sum with brute force")
print("*" * 70)
nums4 = [1, 3, 5, 7, 9, 15, 16]
target4 = 8
result4 = two_sum_brute_force(nums4, target4)
print(f"Input: nums = {nums4}, target = {target4}")
print(f"Output: {result4}")
print(
    f"Giải thích: nums[{result4[0]}] + nums[{result4[1]}] = {nums4[result4[0]]} + {nums4[result4[1]]} = {target4}"
)
