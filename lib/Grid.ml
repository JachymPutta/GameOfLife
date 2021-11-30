type pos = int * int
type grid = bool array array

let directions = [(1, 1); (1, 0); (1, -1); (0, 1); (0, -1); (-1, 1); (-1, 0); (-1,-1)]

let in_bounds n len = n < len && 0 < n 

let neighbors ((x,y) : pos) (g : grid) : (int * pos) =
  let len = Array.length g in 
  let avail = ref 8 in 
  let n, free_l = List.fold_left (fun (no, free_l) (dx, dy) -> 
                    let x', y' = (x + dx, y + dy) in
                    if in_bounds x' len && in_bounds y' len 
                    then  
                      (if g.(x + dx).(y + dy) 
                      then (no + 1, free_l) 
                      else (no, (x + dx,y + dy) :: free_l))
                    else 
                      (decr avail; 
                      no, free_l)
                    )
                  (0, []) directions in 
  (* Printf.printf "RandInt arg: %i \n On pos %i %i\n\n" (!avail - n) x y;  *)
  let rand = if !avail - n = 0 then 0 else Random.int (!avail - n) in 
  let res = List.nth_opt free_l rand in
    match res with
    | Some e -> n,e 
    | None -> n, (0,0)
     
let mk_rand_grid size = 
  let g = Array.make_matrix size size false in 
  for i = 0 to size - 1 do
    for j = 0 to size - 1 do
      if Random.bool ()
      then g.(i).(j) <- true
    done;
  done;
  g 

let print_grid (g : grid) = 
  let n = Array.length g in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      if g.(i).(j)
      then Printf.printf "O  " 
      else Printf.printf ".  " 
    done;
    print_endline ""
  done