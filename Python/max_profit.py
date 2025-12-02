def maxProfit(prices):
    if len(prices) <= 0:
        return 0

    max_profit = 0
    min_price = prices[0]

    for i, price in enumerate(prices):
        if price < min_price:
            min_price = price

        max_profit = max(max_profit, price - min_price)

    return max_profit


def maxProfit_Bruteforce(prices):
    maxProfit = 0
    n = len(prices)

    for i in range(n - 1):
        for j in range(i + 1, n):
            profit = prices[j] - prices[i]
            maxProfit = max(maxProfit, profit)

    return maxProfit


# ===== VÍ DỤ SỬ DỤNG =====

print("=" * 70)
print("VÍ DỤ 1: Trường hợp có lợi nhuận")
print("=" * 70)
prices1 = [7, 1, 5, 3, 6, 4]
result1 = maxProfit(prices1)
print(f"Input:  prices = {prices1}")
print(f"Output: {result1}")
print("Giải thích: Mua ở ngày 2 (giá = 1), bán ở ngày 5 (giá = 6)")
print("           Lợi nhuận = 6 - 1 = 5\n")

print("=" * 70)
print("VÍ DỤ 2: Giá luôn giảm (không có lợi nhuận)")
print("=" * 70)
prices2 = [7, 6, 4, 3, 1]
result2 = maxProfit(prices2)
print(f"Input:  prices = {prices2}")
print(f"Output: {result2}")
print("Giải thích: Không thể có lợi nhuận vì giá luôn giảm\n")

print("=" * 70)
print("VÍ DỤ 3: Giá tăng dần")
print("=" * 70)
prices3 = [1, 2, 3, 4, 5]
result3 = maxProfit(prices3)
print(f"Input:  prices = {prices3}")
print(f"Output: {result3}")
print("Giải thích: Mua ở ngày 1 (giá = 1), bán ở ngày 5 (giá = 5)")
print("           Lợi nhuận = 5 - 1 = 4\n")

print("=" * 70)
print("VÍ DỤ 4: Giá dao động")
print("=" * 70)
prices4 = [2, 4, 1, 7, 5, 11]
result4 = maxProfit(prices4)
print(f"Input:  prices = {prices4}")
print(f"Output: {result4}")
print("Giải thích: Mua ở ngày 3 (giá = 1), bán ở ngày 6 (giá = 11)")
print("           Lợi nhuận = 11 - 1 = 10\n")

print("=" * 70)
print("VÍ DỤ 5: Giá dao động")
print("=" * 70)
prices5 = [2, 4, 1, 7, 5, 11]
result5 = maxProfit_Bruteforce(prices5)
print(f"Input:  prices = {prices5}")
print(f"Output: {result5}")
print("Giải thích: Mua ở ngày 3 (giá = 1), bán ở ngày 6 (giá = 11)")
print("           Lợi nhuận = 11 - 1 = 10\n")
