function twoSum(nums, target) {
  const seen = new Map();
  for (let i = 0; i < nums.length; i++) {
    const complement = target - nums[i];
    if (seen.has(complement)) {
      return [seen.get(complement), i];
    }
    seen.set(nums[i], i);
  }
  return [];
}

// quick sanity checks
console.assert(JSON.stringify(twoSum([2, 7, 11, 15], 9)) === JSON.stringify([0, 1]));
console.assert(JSON.stringify(twoSum([3, 2, 4], 6)) === JSON.stringify([1, 2]));
console.assert(JSON.stringify(twoSum([3, 3], 6)) === JSON.stringify([0, 1]));
console.log("All tests passed.");

module.exports = { twoSum };
