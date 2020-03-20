const compareTriplets = require('../src/compare-triplets');

test('when both arrays empty, return a pair of zeros', () => {
    let ar1 = [];
    let ar2 = [];
    expect(compareTriplets(ar1, ar2)).toBe(0);
})