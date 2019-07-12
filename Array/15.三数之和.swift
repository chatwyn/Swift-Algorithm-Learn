/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 *
 * https://leetcode-cn.com/problems/3sum/description/
 *
 * algorithms
 * Medium (23.06%)
 * Likes:    1126
 * Dislikes: 0
 * Total Accepted:    67.5K
 * Total Submissions: 292.9K
 * Testcase Example:  '[-1,0,1,2,-1,-4]'
 *
 * 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0
 * ？找出所有满足条件且不重复的三元组。
 * 
 * 注意：答案中不可以包含重复的三元组。
 * 
 * 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 * 
 * 满足要求的三元组集合为：
 * [
 * ⁠ [-1, 0, 1],
 * ⁠ [-1, -1, 2]
 * ]
 * 
 * 
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        if nums.count < 3 {
            return results
        }
        let sortNums = nums.sorted()   // n * logn
    
        var a = 0
        var b = 0
        var c = 0
        var bIndex = 0
        var cIndex = 0
        var sum = 0
        
        // 固定一个 
        for i in 0 ..< sortNums.count - 2 {  // n^2
            if i > 0 && sortNums[i] == sortNums[i - 1] {
                continue
            }
            a = sortNums[i]
            bIndex = i + 1
            cIndex = sortNums.count - 1
            
            while bIndex < cIndex {
                b = sortNums[bIndex]
                c = sortNums[cIndex]
                sum = a + b + c
                if sum == 0 {
                    results.append([a, b, c])

                    repeat{
                        bIndex += 1
                    } while (bIndex < cIndex && sortNums[bIndex - 1] == sortNums[bIndex])
                  
                    repeat{
                        cIndex -= 1
                    } while (bIndex < cIndex && sortNums[cIndex + 1] == sortNums[cIndex])
                    
                } else if sum > 0 {
                    cIndex -= 1
                } else {
                    bIndex += 1
                }
            }
            
        }
        
        return results
    }
}



