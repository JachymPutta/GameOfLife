open Grid
open Simul
include Graphics

let tile_size = 6
let screen_size = 600 

let fill_tile startpos nrow ncol tile_size =
    set_color white;
    fill_rect (fst startpos + nrow * tile_size)
        (snd startpos + ncol * tile_size) (tile_size - 2) (tile_size - 2)

let mk_screen () = 
    open_graph " 600x600";
    set_window_title "Game Of Life";
    set_color black

let draw_grid g =
    let nrow = Array.length g.(0)
    and ncol = Array.length g
    and width = size_x ()
    and height = size_y ()
    and edge_sz = 45 in
    let tile_size = (min ((Int.to_float (width - 1)) /. (Int.to_float ncol))
                        ((Int.to_float (height - edge_sz)) /. (Int.to_float nrow)))
                    |> int_of_float
    in
    let board_size = (tile_size * ncol, tile_size * nrow) in
    let startpos = (((width - (fst board_size)) / 2),
                    ((height - (snd board_size)) / 2)) in
    set_color black;
    fill_rect (fst startpos - 3) (snd startpos - 3)
        (tile_size * ncol + 4) (tile_size * nrow + 4);
    set_color yellow;
    for i = 0 to ncol - 1 do
        for j = 0 to nrow - 1 do
        if g.(i).(j)
        then fill_tile startpos i j tile_size
        done;
    done

let to_terminal iterations g =
    for i = 0 to !iterations do 
        (* draw_grid !g; *)
        Printf.printf "Iteration: %i\n" (i + 1);
        print_grid !g;
        g := update !g 
    done;
    Printf.printf "Finished.\n"