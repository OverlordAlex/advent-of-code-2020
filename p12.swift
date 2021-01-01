import Foundation

let contents = try String(contentsOfFile: "in.12")

var wp_n = 1
var wp_e = 10
var sp_n = 0
var sp_e = 0
var heading = 0 // 'E'

contents.enumerateLines { line, _  in
    let dir = line.prefix(1)
    var val: Int = Int(line.suffix(from: line.index(line.startIndex, offsetBy: 1)))!

    switch dir {
        case "N":
            wp_n += val
        case "S":
            wp_n -= val
        case "E":
            wp_e += val
        case "W":
            wp_e -= val
        case "F":
            /* Part1
            switch heading {
                case 90:
                    north += val
                case 270:
                    north -= val
                case 0:
                    east += val
                case 180:
                    east -= val
                default:
                    break
            }*/

            // Part2
            let diffn = wp_n - sp_n
            let diffe = wp_e - sp_e

            sp_n = sp_n + (diffn * val)
            sp_e = sp_e + (diffe * val)
            wp_n = sp_n + diffn
            wp_e = sp_e + diffe 
        case "L":
            // Part1
            //heading = (heading + val) % 360

            // Part2 - we get lucky by only dealing with 90 degrees
            while val > 0 {
                let diffn = wp_n - sp_n
                let diffe = wp_e - sp_e

                wp_n = sp_n + diffe
                wp_e = sp_e - diffn

                val -= 90
            }
        case "R":
            // Part1
            //heading = (heading - val + 360) % 360

            // Part2 - we get lucky by only dealing with 90 degrees
            while val > 0 {
                let diffn = wp_n - sp_n
                let diffe = wp_e - sp_e

                wp_n = sp_n - diffe
                wp_e = sp_e + diffn

                val -= 90
            }
        default:
            break
    }
    print("waypoint: \(wp_n),\(wp_e) ship: \(sp_n),\(sp_e)")
}

print(abs(sp_n) + abs(sp_e))
