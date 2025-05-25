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


### The `Fix` tactic

This tactic allow to introduce data when the goal starts with `∀`.
For instance if the goal if `∀ n : ℕ, n is even ⇒ n+1 is odd` then you can
use `Fix n` or `Fix n : ℕ` to introduce a natural number named `n` in the local context and
turn the goal into `n is even ⇒ n+1 is odd`.

This tactic also handles bounded universal quantifiers. If the goal
start with `∀ ε > 0` then you can write `Fix ε > 0`.
This will introduce `ε` and also an assumption `ε_pos : ε > 0`.



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
