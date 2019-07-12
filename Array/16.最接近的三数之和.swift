/*
 * @lc app=leetcode.cn id=16 lang=swift
 *
 * [16] 最接近的三数之和
 *
 * https://leetcode-cn.com/problems/3sum-closest/description/
 *
 * algorithms
 * Medium (41.12%)
 * Likes:    213
 * Dislikes: 0
 * Total Accepted:    31.1K
 * Total Submissions: 75.5K
 * Testcase Example:  '[-1,2,1,-4]\n1'
 *
 * 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target
 * 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 * 
 * 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 * 
 * 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 * 
 * 
 */
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count >= 3 else {
            fatalError("nums count must more than 2")
        }
        let nums = nums.sorted()   // n * logn
        var minSum = nums[0] + nums[1] + nums[2]
        
        for i in 0 ..< nums.count - 2 {  // n^2
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var start = i + 1, end = nums.count - 1
            while start < end {
                
                let sum = nums[i] + nums[start] + nums[end]
                if abs(sum - target) < abs(minSum - target) {
                    minSum = sum
                }
                
                if sum == target {
                    return minSum
                } else if sum > target {
                    repeat{
                        end -= 1
                    } while (start < end && nums[end + 1] == nums[end])
                } else {
                    repeat{
                        start += 1
                    } while (start < end && nums[start - 1] == nums[start])
                }
            }
            
        }
        
        return minSum
    }
}



