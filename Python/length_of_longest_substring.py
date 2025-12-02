def lengthOfLongestSubstring_v2_sliding_window(s):
    """
    Thời gian: O(n)
    Không gian: O(min(n, m)) - lưu các ký tự trong window

    Cách làm:
    1. Dùng 2 con trỏ (left, right) để tạo một cửa sổ trượt
    2. Mở rộng cửa sổ bằng cách di chuyển right
    3. Khi gặp ký tự lặp, co lại cửa sổ từ trái
    4. Lưu độ dài cửa sổ dài nhất

    Đây là GIẢI PHÁP TỐT NHẤT!
    """
    if not s:
        return 0
    char_set = {}
    left = 0
    max_length = 0

    for right in range(len(s)):
        char = s[right]
        if char in char_set and char_set[char] >= left:
            left = char_set[char] + 1
        char_set[char] = right
        max_length = max(max_length, right - left + 1)
    return max_length


def lengthOfLongestSubstring_v3_sliding_window_set(s):
    """
    Thời gian: O(n)
    Không gian: O(min(n, m))

    Cách làm: Dùng set thay vì dictionary để lưu ký tự
    """
    if not s:
        return 0

    seen = set()
    max_length = 0
    left = 0

    for right in range(len(s)):
        while s[right] in seen:
            seen.remove(s[left])
            left += 1
        seen.add(s[right])
        max_length = max(max_length, right - left + 1)
    return max_length


# ===== KIỂM THỬ CÁC GIẢI PHÁP =====
test_cases = [
    "abcabcbb",  # "abc" = 3
    "bbbbb",  # "b" = 1
    "pwwkew",  # "wke" = 3
    "au",  # "au" = 2
    "",  # "" = 0
    "au",  # "au" = 2
    "dvdf",  # "vdf" = 3
    "aab",  # "ab" = 2
    "abcdefghijklmnopqrstuvwxyz",  # tất cả = 26
    "!@#$%^&*()",  # tất cả = 10
    "abcabcbb",  # "abc" = 3
    "aabaab!bb",  # "ab!" = 3
]

print("=" * 100)
print("LONGEST SUBSTRING WITHOUT REPEATING CHARACTERS - SO SÁNH CÁC GIẢI THUẬT")
print("=" * 100)

for test in test_cases:
    print(f'\nInput: "{test}"')
    print("-" * 100)

    v2 = lengthOfLongestSubstring_v2_sliding_window(test)
    print(f"V2 (Sliding Window) ⭐        : {v2}")

    v3 = lengthOfLongestSubstring_v3_sliding_window_set(test)
    print(f"V3 (Sliding Window + Set)     : {v3}")

# ===== BẢNG SO SÁNH =====
print("\n" + "=" * 100)
print("BẢNG SO SÁNH GIẢI THUẬT")
print("=" * 100)
print(f"{'Giải thuật':<30} {'Thời gian':<15} {'Không gian':<20} {'Ghi chú':<35}")
print("-" * 100)
print(
    f"{'V1: Brute Force':<30} {'O(n³)':<15} {'O(min(n,m))':<20} {'Rất chậm, không dùng':<35}"
)
print(
    f"{'V2: Sliding Window ⭐':<30} {'O(n)':<15} {'O(min(n,m))':<20} {'TỐT NHẤT!':<35}"
)
print(
    f"{'V3: Sliding Window + Set':<30} {'O(n)':<15} {'O(min(n,m))':<20} {'Dễ hiểu hơn V2':<35}"
)
print(
    f"{'V4: Sliding Window - Chi tiết':<30} {'O(n)':<15} {'O(min(n,m))':<20} {'Trả về substring':<35}"
)
print(
    f"{'V5: Dynamic Programming':<30} {'O(n)':<15} {'O(min(n,m))':<20} {'Khó hiểu hơn':<35}"
)
print("=" * 100)

# ===== GIẢI THÍCH SLIDING WINDOW =====
print("\n" + "=" * 100)
print("GIẢI THÍCH THUẬT TOÁN SLIDING WINDOW")
print("=" * 100)
print("""
Ý tưởng chính:
1. Dùng 2 con trỏ (left, right) để tạo một "cửa sổ trượt"
2. Mở rộng cửa sổ bằng cách di chuyển right
3. Theo dõi ký tự đã xuất hiện và vị trí cuối cùng của chúng
4. Khi gặp ký tự lặp, co lại cửa sổ từ trái
5. Lưu độ dài cửa sổ dài nhất

Ví dụ: "abcabcbb"

Step 0: left=0, right=0, s[0]='a'
  char_index = {'a': 0}
  length = 0 - 0 + 1 = 1
  max_length = 1

Step 1: left=0, right=1, s[1]='b'
  char_index = {'a': 0, 'b': 1}
  length = 1 - 0 + 1 = 2
  max_length = 2

Step 2: left=0, right=2, s[2]='c'
  char_index = {'a': 0, 'b': 1, 'c': 2}
  length = 2 - 0 + 1 = 3
  max_length = 3
  Window: "abc"

Step 3: left=0, right=3, s[3]='a'
  'a' đã xuất hiện tại vị trí 0, mà 0 >= left(0)
  left = 0 + 1 = 1 (bỏ ký tự 'a' cũ)
  char_index = {'a': 3, 'b': 1, 'c': 2}
  length = 3 - 1 + 1 = 3
  Window: "bca"

Step 4: left=1, right=4, s[4]='b'
  'b' đã xuất hiện tại vị trí 1, mà 1 >= left(1)
  left = 1 + 1 = 2
  char_index = {'a': 3, 'b': 4, 'c': 2}
  length = 4 - 2 + 1 = 3
  Window: "cab"

... tiếp tục ...

Kết quả: max_length = 3 ("abc")

Độ phức tạp:
- Thời gian: O(n) - duyệt mỗi ký tự tối đa 2 lần (right và left di chuyển)
- Không gian: O(min(n, m)) - lưu ký tự duy nhất trong alphabet
""")
print("=" * 100)
