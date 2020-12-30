import java.io.File
import java.io.BufferedReader

fun runProgram(instrs: MutableList<String>): Boolean {
    var ptr = 0
    var acc = 0
    val seen = mutableSetOf<Int>()

    var instr: String = instrs[ptr].split(' ')[0]
    var value: Int = instrs[ptr].split(' ')[1].toInt()
    while (!seen.contains(ptr)) {
        seen.add(ptr)

        when (instr) {
            "nop" -> ptr += 1
            "acc" -> {ptr += 1; acc += value}
            "jmp" -> ptr += value
        }

        if (ptr >= instrs.size) {
            println(acc)
            return true
        }

        instr = instrs[ptr].split(' ')[0]
        value = instrs[ptr].split(' ')[1].toInt()
    }
    return false
}

fun main(args: Array<String>) {
    val instrs = mutableListOf<String>()
    File("in.8").useLines { lines -> lines.forEach { instrs.add(it) }}

    for (i in instrs.indices) {
        val temp: MutableList<String> = instrs.toMutableList()

        var instr: String = temp[i].split(' ')[0]
        var value: Int = instrs[i].split(' ')[1].toInt()
        var newInstr: String = ""

        when (instr) {
            "nop" -> newInstr = "jmp " + value
            "acc" -> continue
            "jmp" -> newInstr = "nop " + value
        }
        temp[i] = newInstr

        if (runProgram(temp)) {
            break
        }
    }
}
