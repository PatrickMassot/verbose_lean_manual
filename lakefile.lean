import Lake
open Lake DSL

require verso from git "https://github.com/leanprover/verso.git"@"v4.17.0"
require verbose from git "https://github.com/PatrickMassot/verbose-lean4.git"@"master"

package "verbose-manual" where
  -- building the C code cost much more than the optimizations save
  moreLeancArgs := #["-O0"]
  -- work around clang emitting invalid linker optimization hints that lld rejects
  moreLinkArgs :=
    if System.Platform.isOSX then
      #["-Wl,-ignore_optimization_hints"]
    else #[]

lean_lib VerboseManual where

@[default_target]
lean_exe "generate-manual" where
  root := `Main
