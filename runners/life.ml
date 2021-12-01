open Grid
open Simul
open Rendering 

let () =
    let g = ref (mk_rand_grid 20) in
    for i = 0 to 19 do 
        Printf.printf "Iteration: %i \n" (i + 1);
        draw_grid !g;
        g := update !g 
    done;
    print_string "Finished."

