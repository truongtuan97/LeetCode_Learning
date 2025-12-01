def removeDuplicates(nums):
    slow = 0
    for fast in range(1, len(nums)):
        if nums[fast] != nums[slow]:
            slow += 1
            nums[slow] = nums[fast]

    return slow + 1


# ===== TEST VỚI VERSION 2 =====
print("=" * 60)
print("TEST VERSION 2 (Two Pointers):")
print("=" * 60)
nums5 = [1, 1, 2, 2, 3, 4, 4, 5]
print(f"Input: nums = {nums5}")
k5 = removeDuplicates(nums5)
print(f"Output: k = {k5}, nums = {nums5[:k5]}")


# ===== VISUALIZATION - CÁCH HOẠT ĐỘNG =====
print("\n" + "=" * 60)
print("VISUALIZATION - CÁCH THUẬT TOÁN HOẠT ĐỘNG:")
print("=" * 60)


def removeDuplicates_visual(nums):
    """Version có visualization để hiểu rõ hơn"""
    print(f"\nMảng ban đầu: {nums}")
    print(f"Độ dài: {len(nums)}\n")

    if len(nums) <= 1:
        return len(nums)

    k = 1
    print(f"Bắt đầu: k = {k} (vị trí để ghi phần tử unique tiếp theo)")
    print("-" * 60)

    for i in range(1, len(nums)):
        print(f"\nBước {i}: Xét nums[{i}] = {nums[i]}")

        if nums[i] != nums[i - 1]:
            print(f"  → nums[{i}] ({nums[i]}) ≠ nums[{i - 1}] ({nums[i - 1]})")
            print(f"  → Ghi nums[{i}] vào vị trí k = {k}")
            nums[k] = nums[i]
            k += 1
            print(f"  → Mảng hiện tại: {nums}")
            print(f"  → k tăng lên: k = {k}")
        else:
            print(f"  → nums[{i}] ({nums[i]}) = nums[{i - 1}] ({nums[i - 1]})")
            print("  → Bỏ qua (duplicate)")

    print("\n" + "-" * 60)
    print("KẾT QUẢ CUỐI CÙNG:")
    print(f"k = {k}")
    print(f"Mảng sau khi xóa duplicate: {nums[:k]}")
    return k


# Test visualization
nums_visual = [1, 1, 2, 3, 3, 3, 4]
removeDuplicates_visual(nums_visual)
