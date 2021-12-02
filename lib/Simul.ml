open Grid

let update_cell (x,y : pos) g g' =
    let n, (x', y') = neighbors (x,y) g in 
    let is_alive = g.(x).(y) in 
    match n with
    | n when n = 3 || n = 2 && is_alive -> g'.(x').(y') <- true
    | n when n = 3 && not is_alive -> g'.(x).(y) <- true
    | _ ->  g'.(x).(y) <- false
    

let update (g : grid) : grid = 
    let new_g = Array.copy g in 
    let size =  Array.length g in 
    for i = 0 to size - 1 do
        for j = 0 to size - 1 do
             update_cell (i, j) g new_g
        done;
    done;
    new_g
