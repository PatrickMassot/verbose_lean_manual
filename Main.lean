/-
Copyright (c) 2024 Lean FRO LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: David Thrane Christiansen
-/
import VerboseManual
import VersoManual

open Verso.Genre.Manual

def main :=
  manualMain (%doc VerboseManual) (config := config)
where
  config := {
    extraFiles := [("static", "static")],
    extraCss := [
      "/static/colors.css",
      "/static/theme.css",
      "/static/print.css",
      "/static/search/search-box.css",
      "/static/fonts/source-serif/source-serif-text.css",
      "/static/fonts/source-code-pro/source-code-pro.css",
      "/static/fonts/source-sans/source-sans-3.css",
    ],
    emitTeX := false,
    emitHtmlSingle := true, -- for proofreading
    -- sourceLink := some "https://github.com/leanprover/reference-manual",
    -- issueLink := some "https://github.com/leanprover/reference-manual/issues"
  }
