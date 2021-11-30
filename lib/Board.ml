

let print_board board = 
  let n = Array.length board in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      Printf.printf "%d  " board.(i).(j);
    done;
    print_endline ""
  done