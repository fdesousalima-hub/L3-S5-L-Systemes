open Graphics

type command =
| Line of int
| Move of int
| Turn of int
| Store
| Restore

type position = {
  x: float;      (** position x *)
  y: float;      (** position y *)
  a: int;        (** angle of the direction *)
}

(** Put here any type and function implementations concerning turtle *)
let current_position = ref {x = 0.0; y = 0.0; a = 0}

let position_tostring position =
  "x:" ^ Float.to_string (position.x) ^
  " y:" ^ Float.to_string (position.y) ^
  " a:" ^ Int.to_string (position.a)

let print_current () =
  print_string (position_tostring !current_position)

let start_turtle () =
  (current_position) := {x = 200.0; y = 200.0; a = 0};
  moveto (Float.to_int !(current_position).x) (Float.to_int !(current_position).y)

let stock_positions = ref []

let calcNewPos size position =
  {x = Float.of_int size *. cos ((Float.of_int position.a) *. Float.pi /. 180.0) +. position.x ;
   y = Float.of_int size *. sin ((Float.of_int position.a) *. Float.pi /. 180.0) +. position.y ;
   a = position.a}

let line size =
  let new_pos = calcNewPos size !(current_position) in
    lineto (Float.to_int new_pos.x) (Float.to_int new_pos.y);
    (current_position) := new_pos

let move size =
  let new_pos = calcNewPos size !(current_position) in
    moveto (Float.to_int new_pos.x) (Float.to_int new_pos.y);
    (current_position) := new_pos

let turn angle =
  let new_pos = {x = !(current_position).x;
   y = !(current_position).y;
   a = (!(current_position).a + angle) mod 360} in
   (current_position) := new_pos


let store () =
  (stock_positions) := !current_position :: !(stock_positions)

let restore () =
  match !(stock_positions) with
  | [] -> failwith("No store before restore")
  | position :: stock_positions' -> (stock_positions) := stock_positions';
                                    (current_position) := position;
                                    moveto (Float.to_int !(current_position).x) (Float.to_int !(current_position).y)



let execCommand command =
  match command with
  | Line (size) -> line size
  | Move (size) -> move size
  | Turn (angle) -> turn angle
  | Store -> store ()
  | Restore -> restore ()

let rec execCommands commands =
  match commands with
  | [] -> ()
  | command :: commands_reste -> execCommand command;
                                 execCommands commands_reste
