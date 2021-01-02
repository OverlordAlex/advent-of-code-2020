<?php
function part1() {
    $fileHandle = fopen("in.14", "r");

    $andmask = -1;
    $ormask = -1;
    $values =  array();
    while (($line = fgets($fileHandle)) !== false) {
        preg_match('/mask = (.+)/', $line, $mask);
        preg_match('/mem\[([0-9]+)\] = ([0-9]+)/', $line, $matches);
        if ($mask) {
            $andmask = intval(str_replace("X", "1", $mask[1]), 2);
            $ormask = intval(str_replace("X", "0", $mask[1]), 2);
        } else {
            $values[$matches[1]] = ($matches[2] | $ormask) & $andmask ;
        }
    }
    fclose($fileHandle);
    echo array_sum($values)."\n";
}

function part2() {
    $fileHandle = fopen("in.14.basic", "r");
    $mask = "";
    $values =  array();
    while (($line = fgets($fileHandle)) !== false) {
        preg_match('/mask = (.+)/', $line, $maskMatch);
        preg_match('/mem\[([0-9]+)\] = ([0-9]+)/', $line, $matches);
        if ($maskMatch) {
            $mask = $maskMatch[1];
        } else {
            $length = strlen($mask);
            $addr = str_pad($matches[1], $length, "0", STR_PAD_LEFT);
            for ($i = 0; $i < $length; $i++) {
                if ($mask[$i] == '0') {
                    continue;
                } else {
                    $addr[$i] = $mask[$i];
                }
            }
            // sneaky - following non-X updates can overwrite previous wildcards, reducing the possibilities
            // thus when you have a new one, you need to go back over all previous addresses and compensate for the overwrites
            // TODO calculate multiples only at the end
            // TODO when getting a new mask, go back and overwrite all previous masks
            // if a previous mask had an X, and new has a 1, replace X with 0 and vice versa
            // if new mask has an X... replace X with '.' and regex match to overwrite prev
            $values[$addr] = $matches[2];
        }
    }
    fclose($fileHandle);

    $length = count($values);
    $arrKeys = array_keys($values);
    for ($i = 0; $i < $length; $i++) {
        $mask = '/'.str_replace("X", ".", $values[$arrKeys[$i]]).'/';
        for ($j = $i + 1; $j < $length; $j++) {
            preg_match($mask, $values[$arrKeys[$j]], $matched);
            if ($matched) {
                $values[$arrKeys[$j]] = 0; // it would have been overwritten, so it is effectively 0
                continue;
            }
            // change each X on a previous address ?
        }
    }

    $total = 0;
    foreach( array_reverse($values) as $key => $val){
        echo $key."\t=>\t".$val."\n";
        $total += $val << substr_count($key, 'X');
    }
    echo $total."\n";
}

part1();
part2();
?>
