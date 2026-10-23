# 0002 - Valid Parentheses

**Difficulty:** Easy
**Link:** https://leetcode.com/problems/valid-parentheses/

## Problem

Given a string containing just the characters `(`, `)`, `{`, `}`, `[`, `]`, determine if the input string is valid — brackets must close in the correct order.

## Approach

Classic stack problem. Push opening brackets onto a stack. On a closing bracket, pop the stack and check it matches the expected opener. If the stack is empty at a closing bracket, or anything is left on the stack at the end, the string is invalid.

## Complexity

- Time: O(n)
- Space: O(n)
