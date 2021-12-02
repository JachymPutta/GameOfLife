open Grid
open Simul
open Rendering 
open Arg

let g = ref (mk_rand_grid 20)
let iterations = ref 20 
let files = ref []
let rand = ref true
let run = ref false 

let args = 
[ ("-custom", Clear rand ," input a custom starting grid")
; ("-size", Int (fun x -> if x > 1 then g := mk_rand_grid x ), " set size of grid (size > 1)" )
; ("-iter", Int (fun x -> if x > 0 then iterations := x), " number of iterations (i > 0) default 20" )
; ("-r", Set run, " run the simulation")
]

let () =
    try 
        Arg.parse args (fun filename -> files := filename :: !files) 
        "Game of Life \n\
         USAGE: ./life [options] ?<files>\n\
         see README for more information";
        if !rand && !run 
        then to_terminal iterations g 
        else 
            if not !rand 
            then 
                (Printf.printf "Custom board selected, for %i iterations.\n" !iterations;
                Printf.printf "TODO: Implement file parsing.")
    with
        _ -> ()
