open Graphics

let create_window w h =
  open_graph (" " ^ string_of_int w ^ "x" ^ string_of_int h);
  auto_synchronize true


let close_after_event () =
  ignore (wait_next_event [Button_down])
