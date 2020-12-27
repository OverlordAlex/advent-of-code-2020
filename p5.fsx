let rec shift (seats: string) (num: int) =
    match seats with
    | "" -> num
    | _ ->
        match seats.[0] with
        | 'F' | 'L' -> shift seats.[1..] (num <<< 1)
        | 'B' | 'R' -> shift seats.[1..] ((num <<< 1) + 1)
        | _ -> num 

let calc (seat: string) =
    (shift seat.[..6] 0) * 8 + (shift seat.[7..] 0)

open System.IO
let readLines (filePath:string) = seq {
    use sr = new StreamReader (filePath)
    while not sr.EndOfStream do
        //yield calc (sr.ReadLine ())
        yield sr.ReadLine ()
}

// Part A
//readLines "in.5"
//    |> Seq.max 
//    |> printfn "%d"

let doReplace (seats:string) =
    "0b" + seats
            .Replace('F', '0')
            .Replace('L', '0')
            .Replace('B', '1')
            .Replace('R', '1')

let lines: list<int> = readLines "in.5" |> Seq.map doReplace |> Seq.map int |> Seq.sort |> Seq.toList

let rec findMissing (curr:int) (comp:list<int>) =
    if List.isEmpty comp then 0
    else
    match comp.[0] - curr with
        | 1 -> findMissing comp.[0] comp.[1..]
        | _ -> curr + 1

// Part B
findMissing lines.[0] lines.[1..] |> printfn "%d"
