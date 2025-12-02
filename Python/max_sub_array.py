def maxSubarray_v5_kadane_detailed(nums):
    curr_sum, max_sum = 0, 0
    temp_i, start_i, end_i = 0, 0, 0
    n = len(nums)
    for i in range(n):
        if nums[i] > curr_sum + nums[i]:
            curr_sum = nums[i]
            temp_i = i
        else:
            curr_sum += nums[i]

        if max_sum < curr_sum:
            max_sum = curr_sum
            start_i = temp_i
            end_i = i

    return max_sum, start_i, end_i, nums[start_i:end_i]


# ===== KIỂM THỬ CÁC GIẢI PHÁP =====
test_cases = [
    [-2, 1, -3, 4, -1, 2, 1, -5, 4],
    [5, 4, -1, 7, 8],
    [-1],
    [-2, -1],
    [1, 2, 3, 4, 5],
    [-5, -2, -8, -1, -4],
]

print("=" * 80)
print("MAXIMUM SUBARRAY - SO SÁNH CÁC GIẢI THUẬT")
print("=" * 80)

for test in test_cases:
    print(f"\nInput: {test}")
    print("-" * 80)
    max_sum, start, end, subarray = maxSubarray_v5_kadane_detailed(test)
    print(
        f"V5 (Kadane - Chi tiết)     : Tổng={max_sum}, Dãy={subarray} (chỉ số {start}-{end})"
    )


# ===== BẢNG SO SÁNH =====
print("\n" + "=" * 80)
print("BẢNG SO SÁNH GIẢI THUẬT")
print("=" * 80)
print(f"{'Giải thuật':<25} {'Thời gian':<15} {'Không gian':<15} {'Ghi chú':<35}")
print("-" * 80)
print(
    f"{'V5: Kadane (Chi tiết)':<25} {'O(n)':<15} {'O(1)':<15} {'Trả về vị trí dãy con':<35}"
)
print("=" * 80)

# ===== GIẢI THÍCH KADANE =====
print("\n" + "=" * 80)
print("GIẢI THÍCH THUẬT TOÁN KADANE")
print("=" * 80)
print("""
Ý tưởng chính:
- Tại mỗi vị trí i, ta quyết định: dãy con tối ưu kết thúc tại i là gì?
- 2 lựa chọn:
  1. Bắt đầu dãy mới từ nums[i]
  2. Tiếp tục từ nums[i-1] + nums[i]

Ví dụ: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
  i=0: max_current = -2, max_global = -2
  i=1: max_current = max(1, -2+1) = 1, max_global = 1
  i=2: max_current = max(-3, 1-3) = -2, max_global = 1
  i=3: max_current = max(4, -2+4) = 4, max_global = 4
  i=4: max_current = max(-1, 4-1) = 3, max_global = 4
  i=5: max_current = max(2, 3+2) = 5, max_global = 5
  i=6: max_current = max(1, 5+1) = 6, max_global = 6
  i=7: max_current = max(-5, 6-5) = 1, max_global = 6
  i=8: max_current = max(4, 1+4) = 5, max_global = 6

Kết quả: 6 (dãy con [4, -1, 2, 1])
""")
print("=" * 80)
