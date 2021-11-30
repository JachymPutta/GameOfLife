open Grid
open Simul

let () =
    let g = ref (mk_rand_grid 20) in
    for i = 0 to 19 do 
        Printf.printf "Iteration: %i \n" (i + 1);
        print_grid !g;
        g := update !g 
    done;
    print_string "Finished."

