open Printf
exception Err of string;;
(* 
   @ Descrip: join a list of strings
   @ Param: L: list of strings
 *)
let rec strjoin (l:string list): string =
                match l with 
                | [] -> ""
                | h :: t -> h^strjoin(t);;
module Log = struct
        (* 
           @ Descrip: prints ------------ with a newline character
         *)
        let print_underscr () = 
                printf "-------------\n";;
        type color = Red | Green | Yellow | Blue | Magenta | Cyan | White | Reset | Embolden | Italics;;
        (* 
           @ Descrip: lets you print a decorated string
           @ Param: C: color of the string using the color type
           @ Param: S: the string you want to print out
         *)
        let print_special (c:color) (s:string): unit = 
                        match c with
                        | Red -> print_endline(strjoin(["\x1B[31m";s;"\x1B[0m"]))
                        | Green -> print_endline(strjoin(["\x1B[32m";s;"\x1B[0m"]))
                        | Yellow -> print_endline(strjoin(["\x1B[33m";s;"\x1B[0m"]))
                        | Blue -> print_endline(strjoin(["\x1B[34m";s;"\x1B[0m"]))
                        | Magenta -> print_endline(strjoin(["\x1B[35m";s;"\x1B[0m"]))
                        | Cyan -> print_endline(strjoin(["\x1B[36m";s;"\x1B[0m"]))
                        | White -> print_endline(strjoin(["\x1B[37m";s;"\x1B[0m"]))
                        | Reset -> print_endline(strjoin(["\x1B[0m";s]))
                        | Embolden -> print_endline(strjoin(["\x1B[1m";s;"\x1B[0m"]))
                        | Italics -> print_endline(strjoin(["\x1B[3m";s;"\x1B[0m"]));;
        let error s =
                print_endline (strjoin(["\x1B[1m";"\x1B[31m";"[Morgue] Error: ";s;"\x1B[0m"]));
                exit 0;;
        let warning s (sev:string) = 
                print_endline (strjoin(["\x1B[93m";"⚠ ";"[Morgue] Warning: ";s;" Severity: ";sev;"\x1B[0m"]));;
        let success s = 
                print_endline (strjoin(["\x1B[92m";"[Morgue] Success: ";s;"\x1B[0m"]));;
end
module Progress = struct
        (*
         @ Descrip: prints a progress bar
         @ Param: P: percentage from 0-4 (0%-25%-...)
         *)
       (* let loading_bar p s = *)
end
let test1 = Log.success "w?";;
let test = (Log.warning "test" "lul");;
let testing = Log.error "test";;
