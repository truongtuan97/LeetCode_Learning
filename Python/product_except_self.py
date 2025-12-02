def productExceptSelf(nums):
    n = len(nums)
    results = [1] * n
    left, right = 1, 1

    for i in range(n):
        results[i] *= left
        left *= nums[i]

    for i in range(n - 1, -1, -1):
        results[i] *= right
        right *= nums[i]
    return results


# Test
print(productExceptSelf([1, 2, 3, 4]))  # [24, 12, 8, 6]
print(productExceptSelf([2, 3, 4, 5]))  # [60, 40, 30, 24]
print(productExceptSelf([1, 0, 3, 4]))  # [0, 12, 0, 0]
