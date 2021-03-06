//
//  LeetCode1365.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/26.
//

import Foundation

//给你一个数组 nums，对于其中每个元素 nums[i]，请你统计数组中比它小的所有数字的数目。
//
//换而言之，对于每个 nums[i] 你必须计算出有效的 j 的数量，其中 j 满足 j != i 且 nums[j] < nums[i] 。
//
//以数组形式返回答案。
//
//
//
//示例 1：
//
//输入：nums = [8,1,2,2,3]
//输出：[4,0,1,1,3]
//解释：
//对于 nums[0]=8 存在四个比它小的数字：（1，2，2 和 3）。
//对于 nums[1]=1 不存在比它小的数字。
//对于 nums[2]=2 存在一个比它小的数字：（1）。
//对于 nums[3]=2 存在一个比它小的数字：（1）。
//对于 nums[4]=3 存在三个比它小的数字：（1，2 和 2）。
//示例 2：
//
//输入：nums = [6,5,4,8]
//输出：[2,1,0,3]
//示例 3：
//
//输入：nums = [7,7,7,7]
//输出：[0,0,0,0]
//
//
//提示：
//
//2 <= nums.length <= 500
//0 <= nums[i] <= 100

class LeetCode1365 {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var array : [Int] = Array.init(repeating: 0, count: 101)
        let n = nums.count
        for i in 0..<n {
            array[nums[i]] += 1
        }
        
        for i in 1..<101 {
            array[i] += array[i-1]
        }
        
        var result : [Int] = []
        
        for num in nums {
            
            if num != 0 {
                let n = array[num-1]
                result.append(n)
            } else {
                result.append(0)
            }
        }
        
        return result
    }
    
    func test() {
        print(smallerNumbersThanCurrent(
                [8,1,2,2,3])) //[4,0,1,1,3]
    }
    
}
