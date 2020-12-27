import sys

total = 0

for line in open(sys.argv[1], 'r'):
    rule, char, pwrd = line.split()
    mn, mx = map(int, rule.split('-'))
    char = char[0]

    total += (pwrd[mn - 1] == char) ^ (pwrd[mx - 1] == char)

print total
