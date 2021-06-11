open Lsystems (* Librairie regroupant le reste du code. Cf. fichier dune *)
open Systems (* Par exemple *)
open Turtle
open Graphics
open Custom_graphics

(** Gestion des arguments de la ligne de commande.
    Nous suggérons l'utilisation du module Arg
    http://caml.inria.fr/pub/docs/manual-ocaml/libref/Arg.html
*)

let usage = (* Entete du message d'aide pour --help *)
  "Interpretation de L-systemes et dessins fractals"

let action_what () = Printf.printf "%s\n" usage; exit 0

let cmdline_options = [
("--what" , Arg.Unit action_what, "description");
]

let extra_arg_action = fun s -> failwith ("Argument inconnu :"^s)

let start_system = Examples.snow

let current_system = ref (Examples.snow)


let main () =
  Arg.parse cmdline_options extra_arg_action usage;
  create_window 1000 1000;
  start_turtle ();
  interpretation  !(current_system);
  while true do
      let e = Graphics.wait_next_event [Graphics.Key_pressed] in
      if e.Graphics.keypressed then
        let key = e.Graphics.key in
          start_turtle ();
          clear_graph ();
          if key = ' ' then begin
                          (current_system) :=(etape_suivant !(current_system));
                          interpretation !(current_system)
          end
          else if key = 'c' then begin
                          (current_system) := start_system; interpretation  !(current_system);
          end
  done;
  (*moveto (Float.to_int !(current_position).x) (Float.to_int !(current_position).y);
  print_string (position_tostring !(current_position));
  (current_position) := execCommand (Line 100) !(current_position);
  (current_position) := execCommand (Store) !(current_position);
  (current_position) := execCommand (Turn 120) !(current_position);
  print_string (position_tostring !(current_position));
  (current_position) := execCommand (Line 100) !(current_position);
  (current_position) := execCommand (Turn 120) !(current_position);
  print_string (position_tostring !(current_position));
  (current_position) := execCommand (Line 100) !(current_position);
  (current_position) := execCommand (Turn 120) !(current_position);
  print_string (position_tostring !(current_position));
  (current_position) := execCommand (Restore) !(current_position);
  print_string (position_tostring !(current_position));
  (current_position) := execCommand (Line 100) !(current_position);
  print_string (position_tostring !(current_position));
  *)
  close_after_event ()
  (*print_string "le main"*)


(** On ne lance ce main que dans le cas d'un programme autonome
    (c'est-à-dire que l'on est pas dans un "toplevel" ocaml interactif).
    Sinon c'est au programmeur de lancer ce qu'il veut *)

let () = if not !Sys.interactive then main ()
