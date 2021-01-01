import 'dart:io';

void main() {
    Map<int, int> diffs = {1: 0, 
                           2: 0, 
                           3: 0};
    
    new File('in.10').readAsString().then((String contents) {
        List<dynamic> numbers = contents
                                .trim()
                                .split("\n")
                                .map((number) => int.parse(number))
                                .toList();
    numbers.add(0);
    numbers.sort();
    int lastNum = numbers[numbers.length-1] + 3;
    numbers.add(lastNum);

    for (var i = 1; i < numbers.length; i++) {
        int diff = numbers[i] - numbers[i - 1];
        diffs[diff]++;
    }

    // part 1
    print(diffs[1] * diffs[3]);

    // part 2
    Map<int, int> path = { for (var elem in numbers) elem: 0 };
    path[0] = 1;
    List<int> todo = [0];
    while (todo.isNotEmpty) {
        int curr = todo.removeAt(0);
        int nextValue = path[curr];
        for (var i = 1; i <= 3; i++) {
            if (path.containsKey(curr + i)) {
                path[curr + i] += nextValue;
                if (!todo.contains(curr + i)) {
                    todo.add(curr + i);
                }
            }
        }
    }
    print(path[lastNum]);
  });
}
