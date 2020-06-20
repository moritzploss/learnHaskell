# learnHaskell

Learning Haskell!

## Haskell Setup

### Installing `stack`

Setting up a working development environment for Haskell can be challenging.
What I found easiest (on macOS) is to use `brew` to install `stack`, and to
*not* try to install `cabal` and `ghc` manually:

    brew install haskell-stack
    
Then install **IntelliJ** and the **IntelliJ-Haskell** plugin, which provides
syntax highlighting, code completion, type lookups with `hoogle`, and linting
with `hlint`. (I never got code completion and lookups to work with VS Code)

### Troubleshooting

Installing `haskell-stack` can take quite a while (half an hour?) and may fail
if you have anti-malware software installed. It may also fail because of a
`readline` version mismatch, which results in an error similar to this halfway
through the installation:

    dyld: Library not loaded: /usr/local/opt/readline/lib/libreadline.7.dylib
      Referenced from: /usr/local/bin/awk
      Reason: image not found
      
To fix this, check the `readline` version installed on your machine (probably
8.x or higher):

    brew info readline
    
Then run the following (change `7` and `8` depending on your installed version
and the error message):

    ln -sf /usr/local/opt/readline/lib/libreadline.8.0.dylib /usr/local/opt/readline/lib/libreadline.7.dylib

See [here](https://stackoverflow.com/questions/54776971/homebrew-pyenv-install-error-dyld-library-not-loaded-usr-local-opt-readline-l)
for more information on this issue.

## Project Setup

Assuming a working installation of `stack`, run:

    stack build
    stack test