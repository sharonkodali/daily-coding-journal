function isValid(s) {
  const pairs = { ")": "(", "}": "{", "]": "[" };
  const stack = [];
  for (const char of s) {
    if (char in pairs) {
      if (stack.pop() !== pairs[char]) return false;
    } else {
      stack.push(char);
    }
  }
  return stack.length === 0;
}

console.assert(isValid("()") === true);
console.assert(isValid("()[]{}") === true);
console.assert(isValid("(]") === false);
console.assert(isValid("([)]") === false);
console.assert(isValid("{[]}") === true);
console.log("All tests passed.");

module.exports = { isValid };
