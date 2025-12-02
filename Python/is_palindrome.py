def isPalindrome_v2_two_pointers(s):
    """
    Thời gian: O(n)
    Không gian: O(1) - chỉ dùng 2 con trỏ

    Cách làm:
    1. Một con trỏ từ đầu, một từ cuối
    2. Di chuyển dần vào giữa
    3. So sánh từng cặp ký tự (bỏ qua ký tự đặc biệt)

    Đây là GIẢI PHÁP TỐT NHẤT!
    """
    left, right = 0, len(s) - 1
    while left < right:
        while left < right and not s[left].isalnum():
            left += 1
        while left < right and not s[right].isalnum():
            right -= 1

        if s[left].lower() != s[right].lower():
            return False

        left += 1
        right -= 1
    return True


# ===== KIỂM THỬ CÁC GIẢI PHÁP =====
test_cases = [
    "A man, a plan, a canal: Panama",
    "race a car",
    " ",
    "0P",
    "a.",
    ".,",
    "ab_a",
    "12321",
    "12345",
    "Was it a car or a cat I saw?",
    "Madam, I'm Adam",
    "12a21",
]

print("=" * 90)
print("VALID PALINDROME - SO SÁNH CÁC GIẢI THUẬT")
print("=" * 90)

for test in test_cases:
    print(f'\nInput: "{test}"')
    print("-" * 90)

    v2 = isPalindrome_v2_two_pointers(test)
    print(f"V2 (Two Pointers) ⭐      : {v2}")


# ===== BẢNG SO SÁNH =====
print("\n" + "=" * 90)
print("BẢNG SO SÁNH GIẢI THUẬT")
print("=" * 90)
print(f"{'Giải thuật':<25} {'Thời gian':<15} {'Không gian':<15} {'Ghi chú':<35}")
print("-" * 90)
print(f"{'V1: Clean String':<25} {'O(n)':<15} {'O(n)':<15} {'Đơn giản, dễ hiểu':<35}")
print(f"{'V2: Two Pointers ⭐':<25} {'O(n)':<15} {'O(1) ⭐':<15} {'TỐT NHẤT!':<35}")
print(f"{'V3: Regex':<25} {'O(n)':<15} {'O(n)':<15} {'Ngắn gọn nhưng chậm':<35}")
print(f"{'V4: Generator':<25} {'O(n)':<15} {'O(1)':<15} {'Tiết kiệm bộ nhớ':<35}")
print(f"{'V5: Stack':<25} {'O(n)':<15} {'O(n)':<15} {'Thừa, không cần stack':<35}")
print("=" * 90)

# ===== GIẢI THÍCH TWO POINTERS =====
print("\n" + "=" * 90)
print("GIẢI THÍCH THUẬT TOÁN TWO POINTERS")
print("=" * 90)
print("""
Ý tưởng chính:
1. Dùng 2 con trỏ: left ở đầu, right ở cuối
2. Di chuyển dần vào giữa chuỗi
3. Bỏ qua ký tự không phải chữ/số
4. So sánh các ký tự chữ/số (không phân biệt hoa/thường)

Ví dụ: "A man, a plan, a canal: Panama"

  left=0 (A)                          right=39 (a)
    ↓                                   ↓
  A man, a plan, a canal: Panama
  A == a ✓ (không phân biệt hoa/thường)

  left=1 (space → skip)               right=38 (m)
  left=2 (m)
    ↓                                   ↓
  A man, a plan, a canal: Panama
  m == m ✓

  ... tiếp tục so sánh từng cặp ...

Nếu tất cả cặp khớp → palindrome ✓
""")
print("=" * 90)
