/-
Copyright (c) 2025 Patrick Massot. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Patrick Massot
-/

import VersoManual

-- This gets access to most of the manual genre
open Verso.Genre Manual

-- This gets access to Lean code that's in code blocks, elaborated in the same process and
-- environment as Verso
open Verso.Genre.Manual.InlineLean

set_option pp.rawOnError true

#doc (Manual) "Tactics reference" =>
%%%
htmlSplit := .never
%%%

# Tactic reference

## Basic tactics common to all styles

## Traditional versions

The traditional versions of Verbose Lean tactics are fairly close to the native Lean tactics.
They refer to assumption names and do not provide much automation.
The advantage of those tactics is that there is less magic going on, so it’s easier
to understand what Lean is doing.

The disadvantages are that they are further away from paper proofs, both in terms of style
and in term of the level of details.

You can go to the {ref "sec-examples"}[examples section] to get a sample of proofs written in
different styles supported by Verbose Lean, with different levels of automation.

## Nameless versions

The nameless versions of Verbose Lean tactics are closer to paper proofs.
They do not refer to assumption names and provide more automation.
The advantage of those tactics is that they are closer to what we write on paper,
both in terms of style and in term of automation.
The disadvantage is that there is more magic going on, so they can feel less predictable.
They also require a bit more work from teachers to setup automation.

You can go to the {ref "sec-examples"}[examples section] to get a sample of proofs written in
different styles supported by Verbose Lean, with different levels of automation.
