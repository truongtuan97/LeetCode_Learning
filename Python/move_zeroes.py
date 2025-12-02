def moveZeroes(nums):
    write = 0
    for i in range(len(nums)):
        if nums[i] != 0:
            nums[write] = nums[i]
            write += 1

    for i in range(write, len(nums)):
        nums[i] = 0

    return nums


def moveZeroes_V1(nums):
    left = 0
    for right in range(len(nums)):
        if nums[right] != 0:
            nums[left], nums[right] = nums[right], nums[left]
            left += 1

    return nums


print("=" * 70)
print("VÍ DỤ 1:")
print("=" * 70)
nums1 = [0, 1, 0, 3, 12]
print(f"Input:  {nums1}")
moveZeroes_V1(nums1)
print(f"Output: {nums1}")
print("Giải thích: Di chuyển tất cả số 0 về cuối, giữ nguyên thứ tự [1,3,12]\n")

print("=" * 70)
print("VÍ DỤ 2:")
print("=" * 70)
nums2 = [0]
print(f"Input:  {nums2}")
moveZeroes(nums2)
print(f"Output: {nums2}")
print("Giải thích: Chỉ có 1 phần tử\n")

print("=" * 70)
print("VÍ DỤ 3:")
print("=" * 70)
nums3 = [1, 2, 3, 4, 5]
print(f"Input:  {nums3}")
moveZeroes(nums3)
print(f"Output: {nums3}")
print("Giải thích: Không có số 0\n")

print("=" * 70)
print("VÍ DỤ 4:")
print("=" * 70)
nums4 = [0, 0, 0, 1, 2, 3]
print(f"Input:  {nums4}")
moveZeroes(nums4)
print(f"Output: {nums4}")
print("Giải thích: Nhiều số 0 ở đầu\n")

print("=" * 70)
print("VÍ DỤ 5:")
print("=" * 70)
nums5 = [2, 1, 0, 0, 4, 0, 3]
print(f"Input:  {nums5}")
moveZeroes(nums5)
print(f"Output: {nums5}")
print("Giải thích: Số 0 xen kẽ giữa các số khác 0\n")
