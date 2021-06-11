open Turtle
(** Words, rewrite systems, and rewriting *)

type 's word =
  | Symb of 's
  | Seq of 's word list
  | Branch of 's word

type 's rewrite_rules = 's -> 's word

type 's system = {
    axiom : 's word;
    rules : 's rewrite_rules;
    interp : 's -> Turtle.command list }

(** Put here any type and function implementations concerning systems *)
let interpretation_of_symb system sym =
      execCommands (system.interp sym)

let rec interpretation_of_axiom system axiom =
  let rec interpretation_of_seq system symb_list =
    match symb_list with
    | [] -> ()
    | litteral :: list_reste -> interpretation_of_axiom system litteral;
                               interpretation_of_seq system list_reste
    in
  match axiom with
  | Symb(litteral) -> interpretation_of_symb system litteral
  | Seq(litteral_list) -> interpretation_of_seq system litteral_list
  | Branch (new_axiom) -> execCommands [Store] ;
                          interpretation_of_axiom system new_axiom;
                          execCommands [Restore]

let interpretation system =
    interpretation_of_axiom system system.axiom

let etape_suivant system =
  let rec etape_suivant_axiom axiom =
    match axiom with
    | Symb(litteral) -> system.rules litteral
    | Seq (litteral_list) -> Seq (List.map etape_suivant_axiom litteral_list)
    | Branch (new_axiom) -> Branch (etape_suivant_axiom new_axiom)
  in
  {axiom = etape_suivant_axiom system.axiom;
    rules = system.rules;
    interp = system.interp }
