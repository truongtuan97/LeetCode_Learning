def rotate(nums, k):
    k = k % len(nums)
    reverse(nums, 0, len(nums) - 1)
    reverse(nums, 0, k - 1)
    reverse(nums, k, len(nums) - 1)
    return nums


def reverse(nums, start_index, end_index):
    left, right = start_index, end_index
    while left < right:
        nums[left], nums[right] = nums[right], nums[left]
        left += 1
        right -= 1


# ===== VÍ DỤ SỬ DỤNG =====

print("=" * 70)
print("VI DU 1: Xoay 3 buoc")
print("=" * 70)
nums1 = [1, 2, 3, 4, 5, 6, 7]
k1 = 3
print(f"Input: nums={nums1} - k={k1}")
rotate(nums1, k1)
print(f"Output: {nums1}")
print("Giai thich: Xoay 3 buoc => [5,6,7] di len dau \n")

print("=" * 70)
print("VÍ DỤ 2: Xoay 2 bước")
print("=" * 70)
nums2 = [-1, -100, 3, 99]
k2 = 2
print(f"Input:  nums = {nums2}, k = {k2}")
rotate(nums2, k2)
print(f"Output: {nums2}")
print("Giải thích: Xoay 2 bước → [3,99] đi lên đầu\n")

print("=" * 70)
print("VÍ DỤ 3: k lớn hơn n")
print("=" * 70)
nums3 = [1, 2, 3, 4, 5]
k3 = 7
print(f"Input:  nums = {nums3}, k = {k3}")
print("Note: k = 7 > n = 5, nên k % n = 7 % 5 = 2")
rotate(nums3, k3)
print(f"Output: {nums3}")
print("Giải thích: Xoay 2 bước thực tế\n")

print("=" * 70)
print("VÍ DỤ 4: k = 0 hoặc k = n")
print("=" * 70)
nums4 = [1, 2, 3, 4]
k4 = 4
print(f"Input:  nums = {nums4}, k = {k4}")
rotate(nums4, k4)
print(f"Output: {nums4}")
print("Giải thích: k = n, mảng giữ nguyên\n")
