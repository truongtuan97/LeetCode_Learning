def trap(height):
    n = len(height)
    maxLeft, maxRight = 0, 0
    left, right = 0, n - 1
    water = 0
    while left < right:
        if height[left] < height[right]:
            maxLeft = max(maxLeft, height[left])
            water += maxLeft - height[left]
            left += 1
        else:
            maxRight = max(maxRight, height[right])
            water += maxRight - height[right]
            right -= 1
    return water


def trap_with_dp(height):
    if not height or len(height) < 3:
        return 0

    n = len(height)

    left_max = [0] * n
    left_max[0] = height[0]
    for i in range(1, n):
        left_max[i] = max(left_max[i - 1], height[i])

    right_max = [0] * n
    right_max[n - 1] = height[n - 1]
    for i in range(n - 2, -1, -1):
        right_max[i] = max(right_max[i + 1], height[i])

    water = 0
    for i in range(n):
        water += min(left_max[i], right_max[i]) - height[i]
    return water


# ===== VÍ DỤ SỬ DỤNG =====
print("=" * 70)
print("VÍ DỤ TRAP WITH DP:")
print("=" * 70)
height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
print(f"Input:  {height}")
result = trap_with_dp(height)
print(f"Output: {result}")
print("Giải thích: 6 đơn vị nước được chứa (xem visualization)\n")

print("=" * 70)
print("VÍ DỤ 1:")
print("=" * 70)
height1 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
print(f"Input:  {height1}")
result1 = trap(height1)
print(f"Output: {result1}")
print("Giải thích: 6 đơn vị nước được chứa (xem visualization)\n")

print("=" * 70)
print("VÍ DỤ 2:")
print("=" * 70)
height2 = [4, 2, 0, 3, 2, 5]
print(f"Input:  {height2}")
result2 = trap(height2)
print(f"Output: {result2}")
print("Giải thích: 9 đơn vị nước\n")

print("=" * 70)
print("VÍ DỤ 3: Không chứa được nước")
print("=" * 70)
height3 = [1, 2, 3, 4, 5]
print(f"Input:  {height3}")
result3 = trap(height3)
print(f"Output: {result3}")
print("Giải thích: Tăng dần, không có chỗ chứa nước\n")

print("=" * 70)
print("VÍ DỤ 4:")
print("=" * 70)
height4 = [3, 0, 2, 0, 4]
print(f"Input:  {height4}")
result4 = trap(height4)
print(f"Output: {result4}")
print("Giải thích: 7 đơn vị nước\n")

# ===== GIẢI THÍCH CÁCH 2 (DP) =====
print("\n" + "=" * 70)
print("GIẢI THÍCH CÁCH 2 - DYNAMIC PROGRAMMING:")
print("=" * 70)


def trap_dp_visual(height):
    """Visualization cho DP approach"""
    print(f"\nheight = {height}\n")

    n = len(height)

    # Tính left_max
    left_max = [0] * n
    left_max[0] = height[0]
    for i in range(1, n):
        left_max[i] = max(left_max[i - 1], height[i])

    print("BƯỚC 1: Tính left_max (chiều cao lớn nhất bên trái)")
    print(f"height:    {height}")
    print(f"left_max:  {left_max}")
    print()

    # Tính right_max
    right_max = [0] * n
    right_max[n - 1] = height[n - 1]
    for i in range(n - 2, -1, -1):
        right_max[i] = max(right_max[i + 1], height[i])

    print("BƯỚC 2: Tính right_max (chiều cao lớn nhất bên phải)")
    print(f"height:     {height}")
    print(f"right_max:  {right_max}")
    print()

    # Tính nước
    print("BƯỚC 3: Tính nước tại mỗi vị trí")
    print("Công thức: water[i] = min(left_max[i], right_max[i]) - height[i]")
    print("-" * 70)

    water_total = 0
    for i in range(n):
        water_level = min(left_max[i], right_max[i])
        water_here = water_level - height[i]
        water_total += water_here
        print(
            f"Vị trí {i}: min({left_max[i]}, {right_max[i]}) - {height[i]} = {water_level} - {height[i]} = {water_here}"
        )

    print("-" * 70)
    print(f"Tổng: {water_total} đơn vị nước")

    return water_total


test_dp = [4, 2, 0, 3, 2, 5]
trap_dp_visual(test_dp)

# ===== GIẢI THÍCH CÁCH 2 (DP) - CHI TIẾT =====
print("\n" + "=" * 70)
print("GIẢI THÍCH CÁCH 2 - DYNAMIC PROGRAMMING:")
print("=" * 70)
print("""
Ý TƯỞNG CHÍNH:
┌────────────────────────────────────────────────────────────┐
│ Nước tại vị trí i phụ thuộc vào:                           │
│ • Thanh cao NHẤT bên TRÁI của i                            │
│ • Thanh cao NHẤT bên PHẢI của i                            │
│                                                             │
│ Công thức: water[i] = min(left_max[i], right_max[i]) - height[i] │
└────────────────────────────────────────────────────────────┘

TẠI SAO min(left_max, right_max)?
→ Nước sẽ tràn qua phía THẤP HƠN!
→ Mức nước = chiều cao của tường THẤP HƠN
""")


def trap_dp_super_detail(height):
    """Visualization CỰC KỲ CHI TIẾT cho DP approach"""
    print(f"\nheight = {height}")
    print("\nVẽ minh họa ban đầu:")

    # Vẽ thanh
    max_h = max(height)
    n = len(height)
    for level in range(max_h, 0, -1):
        line = ""
        for i in range(n):
            if height[i] >= level:
                line += "█ "
            else:
                line += "  "
        print(line)
    print("─" * (n * 2))
    print(" ".join(str(i) for i in range(n)))

    print("\n" + "=" * 70)
    print("BƯỚC 1: Tính left_max[i] - Thanh cao nhất từ ĐẦU đến vị trí i")
    print("=" * 70)

    left_max = [0] * n
    left_max[0] = height[0]

    print(f"\nKhởi tạo: left_max[0] = height[0] = {height[0]}")
    print(f"left_max = {left_max}")

    for i in range(1, n):
        old_val = left_max[i]
        left_max[i] = max(left_max[i - 1], height[i])

        print(f"\ni = {i}:")
        print(f"  left_max[{i}] = max(left_max[{i - 1}], height[{i}])")
        print(f"                = max({left_max[i - 1]}, {height[i]}) = {left_max[i]}")
        print(f"  Giải thích: Thanh cao nhất từ đầu đến vị trí {i} là {left_max[i]}")
        print(f"  left_max hiện tại = {left_max}")

    print("\n" + "─" * 70)
    print("KẾT QUẢ BƯỚC 1:")
    print(f"height:   {height}")
    print(f"left_max: {left_max}")

    # Vẽ minh họa left_max
    print("\nMinh họa left_max:")
    for i in range(n):
        print(f"Vị trí {i}: thanh cao nhất từ [0..{i}] = {left_max[i]}")

    print("\n" + "=" * 70)
    print("BƯỚC 2: Tính right_max[i] - Thanh cao nhất từ vị trí i đến CUỐI")
    print("=" * 70)

    right_max = [0] * n
    right_max[n - 1] = height[n - 1]

    print(f"\nKhởi tạo: right_max[{n - 1}] = height[{n - 1}] = {height[n - 1]}")
    print(f"right_max = {right_max}")

    for i in range(n - 2, -1, -1):
        old_val = right_max[i]
        right_max[i] = max(right_max[i + 1], height[i])

        print(f"\ni = {i}:")
        print(f"  right_max[{i}] = max(right_max[{i + 1}], height[{i}])")
        print(
            f"                 = max({right_max[i + 1]}, {height[i]}) = {right_max[i]}"
        )
        print(f"  Giải thích: Thanh cao nhất từ vị trí {i} đến cuối là {right_max[i]}")
        print(f"  right_max hiện tại = {right_max}")

    print("\n" + "─" * 70)
    print("KẾT QUẢ BƯỚC 2:")
    print(f"height:    {height}")
    print(f"right_max: {right_max}")

    # Vẽ minh họa right_max
    print("\nMinh họa right_max:")
    for i in range(n):
        print(f"Vị trí {i}: thanh cao nhất từ [{i}..{n - 1}] = {right_max[i]}")

    print("\n" + "=" * 70)
    print("BƯỚC 3: Tính nước tại mỗi vị trí")
    print("=" * 70)
    print("\nCông thức: water[i] = min(left_max[i], right_max[i]) - height[i]")
    print("\nLý do dùng min():")
    print("  → Nước sẽ tràn qua phía THẤP HƠN")
    print("  → Mức nước bị giới hạn bởi tường THẤP HƠN")
    print("\n" + "─" * 70)

    # Tạo bảng đẹp
    print(
        f"\n{'Vị trí':<8} {'height':<8} {'left_max':<10} {'right_max':<10} {'min':<8} {'water':<8}"
    )
    print("─" * 70)

    water_total = 0
    water_at = []

    for i in range(n):
        min_wall = min(left_max[i], right_max[i])
        water_here = min_wall - height[i]
        water_total += water_here
        water_at.append(water_here)

        print(
            f"{i:<8} {height[i]:<8} {left_max[i]:<10} {right_max[i]:<10} {min_wall:<8} {water_here:<8}"
        )

    print("─" * 70)
    print(f"{'TỔNG':<46} {water_total}")

    print("\n" + "=" * 70)
    print("GIẢI THÍCH CHI TIẾT TỪNG VỊ TRÍ:")
    print("=" * 70)

    for i in range(n):
        min_wall = min(left_max[i], right_max[i])
        water_here = water_at[i]

        print(f"\nVị trí {i}: height = {height[i]}")
        print(f"  • Tường cao nhất bên TRÁI: {left_max[i]}")
        print(f"  • Tường cao nhất bên PHẢI: {right_max[i]}")
        print(f"  • Mức nước = min({left_max[i]}, {right_max[i]}) = {min_wall}")

        if water_here > 0:
            print(f"  • Nước tại đây = {min_wall} - {height[i]} = {water_here} ✓")
            print(
                f"    → CÓ NƯỚC vì mức nước ({min_wall}) > chiều cao thanh ({height[i]})"
            )
        else:
            print(f"  • Nước tại đây = {min_wall} - {height[i]} = {water_here}")
            print("    → KHÔNG CÓ NƯỚC vì thanh đủ cao hoặc ở biên")

    print("\n" + "=" * 70)
    print("VẼ KẾT QUẢ CUỐI CÙNG:")
    print("=" * 70)

    # Vẽ kết quả với nước
    print()
    for level in range(max_h, 0, -1):
        line = ""
        for i in range(n):
            if height[i] >= level:
                line += "█ "
            elif height[i] + water_at[i] >= level:
                line += "≈ "  # Nước
            else:
                line += "  "
        print(line)
    print("─" * (n * 2))
    print(" ".join(str(i) for i in range(n)))

    print("\nKý hiệu: █ = Thanh, ≈ = Nước")
    print(f"\n{'═' * 70}")
    print(f"TỔNG NƯỚC: {water_total} đơn vị")
    print(f"{'═' * 70}")

    return water_total


print("\n" + "=" * 70)
print("VÍ DỤ 1: TRAPPING RAIN WATER VỚI DP")
print("=" * 70)
test_dp1 = [4, 2, 0, 3, 2, 5]
trap_dp_super_detail(test_dp1)


print("\n\n" + "=" * 70)
print("VÍ DỤ 2: TRAPPING RAIN WATER VỚI DP")
print("=" * 70)
test_dp2 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
trap_dp_super_detail(test_dp2)


# ===== SO SÁNH TRỰC QUAN 3 VỊ TRÍ =====
print("\n" + "=" * 70)
print("SO SÁNH TRỰC QUAN - TẠI SAO CẦN min(left_max, right_max)?")
print("=" * 70)
print("""
VÍ DỤ: height = [4, 2, 0, 3, 2, 5]

Xét vị trí i=2 (height=0):

┌─────────────────────────────────────────────────────────────┐
│ Tình huống:                                                 │
│                                                             │
│     5       █                                              │
│     4 █ ≈ ≈ ≈ ≈ █    left_max[2] = 4 (thanh ở vị trí 0)  │
│     3 █ ≈ ≈ █ ≈ █    right_max[2] = 5 (thanh ở vị trí 5) │
│     2 █ █ ≈ █ █ █                                          │
│     1 █ █ ≈ █ █ █    Nước bị giới hạn bởi tường THẤP hơn │
│     0 0 1 2 3 4 5    → min(4, 5) = 4                       │
│             ↑                                               │
│           Vị trí này                                       │
└─────────────────────────────────────────────────────────────┘

Nếu dùng left_max = 4:
  → Nước = 4 - 0 = 4 ✓ ĐÚNG!

Nếu dùng right_max = 5:
  → Nước = 5 - 0 = 5 ✗ SAI! (Nước sẽ tràn qua tường trái)

Nếu dùng min(4, 5) = 4:
  → Nước = 4 - 0 = 4 ✓ ĐÚNG!

═══════════════════════════════════════════════════════════

KẾT LUẬN:
Nước bị giới hạn bởi tường THẤP HƠN vì nước sẽ tràn qua đó!
→ Phải dùng min(left_max, right_max)
""")
