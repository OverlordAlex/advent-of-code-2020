fs = require('fs')
fs.readFile('in.6', 'utf8', function (err, data) {
    if (err) {
        return console.log(err);
    }

    // part1
    var result = data.split('\n\n').map(x => (new Set(x.replace(/\n/g, "")).size)).reduce((a, b) => a + b, 0)
    console.log(result)
    
    // part2
    var result = data.trim().split('\n\n').map(x => x.split('\n'));

    result.forEach(function(group, index) { 
            this[index] = group.reduce((a, b) => [...a].filter(i => b.includes(i)), [...group[0]]);
    }, result)

    var result = result.map(x => x.length).reduce((a, b) => a + b, 0)
    console.log(result)
});
