# 0001 - Two Sum

**Difficulty:** Easy
**Link:** https://leetcode.com/problems/two-sum/

## Problem

Given an array of integers `nums` and an integer `target`, return the indices of the two numbers that add up to `target`.

## Approach

Single pass with a hash map. For each number, check whether `target - num` has already been seen. If so, we've found the pair. Otherwise, store the current number's index and keep going.

This avoids the O(n^2) brute force of checking every pair.

## Complexity

- Time: O(n)
- Space: O(n)
