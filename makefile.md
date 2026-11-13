# MikroC Makefile generator findings

These findings are intended for the VS Code plugin that generated the
[Makefile](./Makefile). They describe the observed behavior on Windows with
GNU Make from MSYS2, Windows PowerShell, and MikroC PRO for PIC32. They are
not a claim that the same quoting works with every shell or compiler version.

## The slow-build problem

The original generated Makefile took about 162 seconds to build this 16-file
project; the MikroC IDE reported 4.531 seconds. Starting the build from an
external CMD window instead of VS Code saved only about 10 seconds overall.
GNU Make and PowerShell startup overhead did not explain the difference.

During the slow build, the compiler launched a new `mcpp.exe` preprocessor
roughly every 10 seconds. The preprocessors remained running after the build,
and the existing `.cp` preprocessor output files were not refreshed. The
compiler nevertheless reported successful compilation and linking. Old
preprocessed output can be unsafe if the source has changed.

The compiler-generated `mcpp` command had malformed quoting around the
library `Uses` include path. An isolated test of that captured command showed
that `mcpp` read standard input instead of the source file and waited while
input remained open. Correcting the quoting made the same test preprocess the
source immediately.

## Verified Makefile changes

The following snippets are literal Makefile text, not the arguments received
by the compiler. They depend on the existing `MIKROC_PATH` definition and
the current Make -> MSYS shell -> PowerShell -> compiler invocation.

1. Remove the trailing backslashes from the `Uses` **include path**:

   ```make
   # Before
   -IP$(MIKROC_PATH)\\Uses\\\\\"
   # After
   -IP$(MIKROC_PATH)\\Uses\"
   ```

   In an isolated compiler test, the `Uses` include path without a trailing
   backslash preprocessed a source file in milliseconds. A doubled trailing
   backslash reproduced the stuck preprocessor.

2. Reduce the trailing backslashes on the **project source search path**:

   ```make
   # Before
   -SP\"c:\Users\davec\GIT\Pic32mzCNC\\\\\"
   # After
   -SP\"c:\Users\davec\GIT\Pic32mzCNC\\\"
   ```

   With the extra backslash, newly generated `.cp` files contained paths such
   as `Pic32mzCNC///Main.c`, and compiler diagnostics showed `Pic32mzCN`
   instead of the source filename. The corrected path produced
   `Pic32mzCNC/Main.c` and restored `Main.c` in diagnostics.

3. The `Defs` and `Uses` **`-SP`** paths were subsequently simplified:

   ```make
   # Before
   -SP$(MIKROC_PATH)\\Defs\\\\\"
   -SP$(MIKROC_PATH)\\Uses\\\\\"
   # After
   -SP$(MIKROC_PATH)\\Defs\\\"
   -SP$(MIKROC_PATH)\\Uses\\\"
   ```

   A full build with these settings succeeded. This does not imply the
   `-SP` escaping can be copied to `-IP`: paths containing spaces and
   trailing backslashes cross several different quoting layers.

## Verification

After both changes, `make` completed in **2.56 seconds** wall time; the
compiler reported **2.235 seconds**, successful compilation and linking.
All 16 `.cp` files and the HEX file were regenerated, and source filenames
appeared correctly in diagnostics. Existing compiler warnings remained.

After simplifying the `Defs` and `Uses` `-SP` paths as well, `make` completed
in **2.64 seconds** wall time; the compiler reported **2.313 seconds** and
successful linking. All 16 `.cp` files and the HEX were regenerated,
diagnostic filenames were correct, and no new `mcpp` processes remained.

The IDE command recorded in the Makefile includes `-RA`, while the normal
`make` target does not. The original source search paths and library order
also differ. The IDE timing is therefore useful context, but does not prove
the two builds used identical command lines.

## Guidance for the generator

- Treat paths as paths, not as pre-escaped string fragments. Quote them for
  each actual launch layer, especially when they contain spaces or end in a
  backslash. Verify the arguments received by the compiler and by its `mcpp`
  subprocess, not just the command displayed by `make -n`.
- Reproduce the verified `-IP` and project `-SP` behavior above when using
  this invocation style. If the generator changes shells or process-launch
  strategy, re-test rather than copying the literal escape sequences.
- Add regression tests using paths with spaces and a project with multiple
  source files. Check that `.cp` files are refreshed, source names in
  diagnostics are correct, no new preprocessors are left waiting, and a
  fresh HEX is generated. Test `make` and `make rebuild` separately.
- Test error reporting with an intentionally invalid source and a pre-existing
  HEX. The current Makefile checks whether a HEX exists, which alone cannot
  prove that the current build produced it. In an isolated test, the compiler
  also returned exit code zero despite reporting a missing `main` function;
  do not rely on the exit code alone without validating compiler behavior.
- `all` is phony and always invokes the compiler; any incremental behavior
  is the compiler's, not dependency tracking by Make. The current `clean`
  target removes all matching files in the project directory, including
  `*.emcl`; a generator should avoid deleting user-supplied libraries.
- The current `MIKROC_PATH` embeds an opening escaped quote, and the project
  paths are hard-coded. A generator should test compiler-path overrides and
  projects in different directories rather than assuming these values are
  portable.
