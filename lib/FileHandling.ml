let read_lines filename =
    let lines = ref [] in
    let chan = open_in filename in
    try
    while true; do
        lines := input_line chan :: !lines
    done; !lines
    with End_of_file ->
    close_in chan;
    List.rev !lines 

let read_grid lines =
    let len = List.length lines in 
    let g = Array.make_matrix len len false in 
    List.iteri (fun i s -> String.iteri (fun j c -> if c = '1' then g.(i).(j) <- true) s) lines;
    g