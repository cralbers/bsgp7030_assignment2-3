# Code review: `assignment3` → `main`

**PR:** [Assignment3 (#4)](https://github.com/cralbers/bsgp7030_assignment2-3/pull/4)  
**Diff:** 3 commits, 10 files (`+318 / −18411`, mostly HTML deletion)

## Verdict

Core Part A analysis changes look solid (metrics, annotations, scripts/PNGs aligned). Before merge, fix README, notebook output consistency, and the deleted HTML exports.

## What looks good

- **Scripts** print slope, intercept, Pearson’s r, and MSE, and annotate the regression plot — matches the notebooks.
- **PNGs** regenerated with equation + `r`.
- **Notebooks** have clearer section markdown, inline comments, and an interpretation cell for slope / intercept / r / MSE.
- CLI interface (`FILENAME X_COL Y_COL`) is preserved.

## Issues to address

### 1. README is effectively emptied

Branch README is only submission URLs. Main’s usage, structure, conda setup, and `export_notebooks.sh` docs are gone. Also, “before merge” and “after merge” both point at the same tag (`assignment3-final`).

### 2. HTML exports deleted, but tooling still expects them

`ai/linear_regression_*.html` are removed, while `ai/export_notebooks.sh` still runs `--to html`. Main README still documents those HTML files. Either regenerate and commit them, or update the export script/docs to stop requiring them.

### 3. Python notebook has no saved outputs; R does

Local/branch Python notebook: all code cells have empty outputs. R notebook still has executed outputs (including metrics). Inconsistent for review/grading — re-execute the Python notebook (or clear both).

### 4. `PROMPTS.md` → `PROMPTS_assignment2.md`

Rename is fine, but main README linked `ai/PROMPTS.md`. After merge that link breaks unless README is restored/updated.

### 5. PR description is stale

“Adding in ai generated files” doesn’t match this diff (enhancing existing AI notebooks/scripts). Worth updating.

## Minor / non-blocking

- Commit messages are informal (`updating readme`, truncated “used AI to redo part A…”).
- `environment.yml` exists on this branch’s history but not on current `main`’s `ai/` listing — watch for merge oddities around that file.

## Suggested merge checklist

1. Restore a useful README (or keep submission links *and* usage/setup).
2. Re-run `export_notebooks.sh` (or equivalent) so Python/R notebooks and HTML stay in sync — or intentionally drop HTML and update the script.
3. Confirm both notebooks show the same metrics when opened.
4. Update the PR title/body to describe the annotation/metrics work.
