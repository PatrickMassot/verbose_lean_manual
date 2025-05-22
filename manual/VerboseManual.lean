/-
Copyright (c) 2024-2025 Lean FRO LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: David Thrane Christiansen
-/

import VersoManual

import VerboseManual.Papers
import VerboseManual.DocFeatures

-- This gets access to most of the manual genre
open Verso.Genre Manual

-- This gets access to Lean code that's in code blocks, elaborated in the same process and
-- environment as Verso
open Verso.Genre.Manual.InlineLean


open VerboseManual

set_option pp.rawOnError true

-- This is the source of code examples to be shown in the document. It should be relative to the
-- current Lake workspace. One good way to set up the files is in a Git repository that contains one
-- Lake package for example code and another for the docs, as sibling directories.
set_option verso.exampleProject "../examples"

-- This is the module that will be consulted for example code. It can be overridden using the
-- `(module := ...)` argument to most elements that show code.
set_option verso.exampleModule "VerboseDemo.Examples"




#doc (Manual) "Verbose Lean" =>
%%%
authors := ["Patrick Massot"]
%%%

Here's some sample introductory text.

Verbose Lean allows controlled natural language to be used to write proofs, without compromising on the level of feedback provided by Lean.
By default, a proof may look like this:

```anchor ContinuitySequentialContLean
example (f : ℝ → ℝ) (u : ℕ → ℝ) (x₀ : ℝ)
    (hf : continuous_function_at f x₀) (hu : sequence_tendsto u x₀) :
    sequence_tendsto (f ∘ u) (f x₀) := by
  intro ε ε_pos
  rcases hf ε ε_pos with ⟨δ, δ_pos, hδ⟩
  rcases hu δ δ_pos with ⟨N, hN⟩
  use N
  intro n n_ge
  apply hδ
  apply hN
  exact n_ge
```

With Verbose Lean, it can look like this:

```anchor ContinuitySequentialCont
Exercise "Continuity implies sequential continuity"
  Given: (f : ℝ → ℝ) (u : ℕ → ℝ) (x₀ : ℝ)
  Assume: (hu : u converges to x₀) (hf : f is continuous at x₀)
  Conclusion: (f ∘ u) converges to f x₀
Proof:
  Fix ε > 0
  By hf applied to ε using ε_pos we get δ such that δ_pos and Hf
  By hu applied to δ using δ_pos we get N such that Hu
  Let's prove that N works
  Fix n ≥ N
  We apply Hf
  We apply Hu
  We conclude by n_ge
QED
```

For instance, the line

```anchorTerm ContinuitySequentialCont
By hf applied to ε using ε_pos we get δ such that δ_pos and Hf
```

corresponds to

```anchorTerm ContinuitySequentialContLean
rcases hf ε ε_pos with ⟨δ, δ_pos, hδ⟩
```



{include 1 VerboseManual.DocFeatures}

# Notes

Use {lean}`margin` to create a marginal note.{margin}[Marginal notes should be used like footnotes.]

# Citations

Cite works using {lean}`citet`, {lean}`citep`, or {lean}`citehere`.
They take a name of a citable reference value as a parameter.
References should be defined as values, typically in one module that is imported (similar to the role of a `.bib` file in LaTeX).

Textual citations, as with {citet someThesis}[], look like this.
Parenthetical {citep someArXiv}[] looks like this.
Use {lean}`citehere` to literally include the cite rather than making a margin note, e.g. {citehere somePaper}[].
Literally-included cites are mostly useful when performing citation inside a margin note.

# Section References
%%%
tag := "sec-ref"
%%%

Sections with tags can be cross-referenced.
They additionally gain permalink indicators that can be used to link to them even if the document is reorganized.
Tags are added in section metadata, e.g.
````
%%%
tag := "my-tag"
%%%
````
They can be linked to using {lean}`ref`.
Here's one to {ref "sec-ref"}[this section].



# Viewing the Output

Verso's HTML doesn't presently work correctly when opened directly in a browser, so it should be served via a server.{margin}[This is due to security restrictions on retrieved files: some of the code hovers are deduplicated to a JSON file that's fetched on demand.]
Python has a simple web server module that's useful for this.
In the output directory, run:
```
python3 -m http.server 8000 --directory .
```
The port and root can be customized by modifying the appropriate parameters.

One downside of this simple server is that it sets cache headers optimistically.
If incorrect hovers are appearing locally, then try disabling caching in your browser's development tools.

# Using an Index

{index}[index]
The index should contain an entry for “lorem ipsum”.
{index}[lorem ipsum] foo
{index subterm:="of lorem"}[ipsum]
{index subterm:="per se"}[ipsum]
{index}[ipsum]
Lorem ipsum dolor {index}[dolor] sit amet, consectetur adipiscing elit, sed {index}[sed] do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris {index}[laboris] {see "lorem ipsum"}[laboris] {seeAlso "dolor"}[laboris] nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

This is done using the `{index}[term]` syntax. Sub-terms {index subterm:="sub-term"}[entry] can be added using the `subterm` parameter to `index`.

Multiple index {index}[index] targets for a term also work.

{ref "index"}[Index link]


# Index
%%%
number := false
tag := "index"
%%%

{theIndex}
