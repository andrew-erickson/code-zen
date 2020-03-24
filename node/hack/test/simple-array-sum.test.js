const simpleArraySum = require('../src/simple_array_sum');

test('adds contents of an empty array to equal  0', () => {
    let emptyArray = [];
    expect(simpleArraySum(emptyArray)).toBe(0);
});

test('adds contents of a 1 element array to equal to the element value', () => {
    let oneItemArray = [500];
    expect(simpleArraySum(oneItemArray)).toBe(500);
});

test('adds multiple numbers', () => {
    let multipleItemsArray = [1, 2, 3, 4, 5];
    expect(simpleArraySum(multipleItemsArray)).toBe(15);
});