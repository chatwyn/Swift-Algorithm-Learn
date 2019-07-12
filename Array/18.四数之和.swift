/*
 * @lc app=leetcode.cn id=18 lang=swift
 *
 * [18] 四数之和
 *
 * https://leetcode-cn.com/problems/4sum/description/
 *
 * algorithms
 * Medium (35.71%)
 * Likes:    249
 * Dislikes: 0
 * Total Accepted:    22.9K
 * Total Submissions: 64K
 * Testcase Example:  '[1,0,-1,0,-2,2]\n0'
 *
 * 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c
 * + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 * 
 * 注意：
 * 
 * 答案中不可以包含重复的四元组。
 * 
 * 示例：
 * 
 * 给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。
 * 
 * 满足要求的四元组集合为：
 * [
 * ⁠ [-1,  0, 0, 1],
 * ⁠ [-2, -1, 1, 2],
 * ⁠ [-2,  0, 0, 2]
 * ]
 * 
 * 
 */
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        guard nums.count >= 4 else {
            return results
        }
        let nums = nums.sorted()
        var a = 0
        var b = 0
        var c = 0
        var d = 0
        var cIndex = 0
        var dIndex = 0
        var sum = 0
        
        for i in 0 ..< nums.count - 3 {  // n^3
            guard i == 0 || nums[i] != nums[i - 1] else {
                continue
            }
            a = nums[i]
            for j in i + 1 ..< nums.count - 2 {
                guard j == i + 1 || nums[j] != nums[j - 1] else {
                    continue
                }
                b = nums[j]
                cIndex = j + 1
                dIndex = nums.count - 1
                
                while cIndex < dIndex {
                    c = nums[cIndex]
                    d = nums[dIndex]
                    sum = a + b + c + d
                    if sum == target {
                        results.append([a, b, c, d])
                        
                        repeat{
                            cIndex += 1
                        } while (cIndex < dIndex && nums[cIndex - 1] == nums[cIndex])
                        
                        repeat{
                            dIndex -= 1
                        } while (cIndex < dIndex && nums[dIndex + 1] == nums[dIndex])
                        
                    } else if sum > target {
                        dIndex -= 1
                    } else {
                        cIndex += 1
                    }
                }
            }
        }
        
        return results
    }
}


