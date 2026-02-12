open Unix

let games_repo = "https://github.com/aidasofialily-cmd/camlboy-games.git"
let target_dir = "roms/games"

let run_cmd cmd =
  print_endline ("Executing: " ^ cmd);
  match system cmd with
  | WEXITED 0 -> ()
  | _ -> failwith ("Command failed: " ^ cmd)

  let setup_submodule () =
  (* 1. Check for RGBDS dependency *)
  print_endline "🔍 Checking for RGBDS (Game Boy Assembler)...";
  if not (command_exists "rgbasm") then
    failwith "❌ Error: 'rgbasm' not found. Please install RGBDS (https://github.com/rednex/rgbds) to compile test ROMs.";

let setup_submodule () =
  print_endline "🐫 Initializing Camlboy-Games submodule...";
  
  if not (Sys.file_exists ".git") then
    failwith "Error: Not a git repository. Please initialize git first.";

  (* Add the submodule if the directory doesn't exist *)
  if not (Sys.file_exists target_dir) then
    run_cmd (Printf.sprintf "git submodule add %s %s" games_repo target_dir)
  else
    run_cmd "git submodule update --init --recursive";

  (* Enter the directory and build the ROMs *)
  print_endline "🏗️  Building Homebrew ROMs...";
  run_cmd (Printf.sprintf "make -C %s" target_dir);
  
  print_endline "✅ ROMs are ready in roms/games/games/"

let () =
  try setup_submodule ()
  with Failure msg -> 
    prerr_endline msg;
    exit 1
