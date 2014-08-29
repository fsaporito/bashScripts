#!bin/bash

charset=123456789
path="/home/darkeffe/rules"

mkdir -p $path

# Transmutation
mp32 "l" -o $path/lower.rule
mp32 "c" -o $path/upper-first.rule
mp32 "u" -o $path/upper-all.rule
mp32 "d" -o $path/double-word.rule
mp32 "f" -o $path/double-word-reflected.rule
mp32 "q" -o $path/double-all-character.rule
mp32 "r" -o $path/reverse.rule
mp32 "t" -o $path/toggle.rule

# Prefix 0-9
mp32 -1 $charset "^?1" -o $path/prefix-0-9.rule
mp32 -1 $charset "l^?1" -o $path/lower-all-prefix-0-9.rule
mp32 -1 $charset "c^?1" -o $path/upper-first-prefix-0-9.rule
mp32 -1 $charset "u^?1" -o $path/upper-all-prefix-0-9.rule
mp32 -1 $charset "d^?1" -o $path/double-word-prefix-0-9.rule
mp32 -1 $charset "f^?1" -o $path/double-word-reflected-prefix-0-9.rule
mp32 -1 $charset "q^?1" -o $path/double-all-character-prefix-0-9.rule
mp32 -1 $charset "r^?1" -o $path/reverse-prefix-0-9.rule
mp32 -1 $charset "t^?1" -o $path/toggle-prefix-0-9.rule
# Suffix 0-9
mp32 -1 $charset "$?1" -o $path/suffix-0-9.rule
mp32 -1 $charset "l$?1" -o $path/lower-all-suffix-0-9.rule
mp32 -1 $charset "c$?1" -o $path/upper-first-suffix-0-9.rule
mp32 -1 $charset "u$?1" -o $path/upper-all-suffix-0-9.rule
mp32 -1 $charset "d$?1" -o $path/double-word-suffix-0-9.rule
mp32 -1 $charset "f$?1" -o $path/double-word-reflected-suffix-0-9.rule
mp32 -1 $charset "q$?1" -o $path/double-all-character-suffix-0-9.rule
mp32 -1 $charset "r$?1" -o $path/reverse-suffix-0-9.rule
mp32 -1 $charset "t$?1" -o $path/toggle-suffix-0-9.rule

# Prefix 0-99
mp32 -1 $charset "^?1^?1" -o $path/prefix-0-99.rule
mp32 -1 $charset "l^?1^?1" -o $path/lower-all-prefix-0-99.rule
mp32 -1 $charset "c^?1^?1" -o $path/upper-first-prefix-0-99.rule
mp32 -1 $charset "u^?1^?1" -o $path/upper-all-prefix-0-99.rule
mp32 -1 $charset "d^?1^?1" -o $path/double-word-prefix-0-99.rule
mp32 -1 $charset "f^?1^?1" -o $path/double-word-reflected-prefix-0-99.rule
mp32 -1 $charset "q^?1^?1" -o $path/double-all-character-prefix-0-99.rule
mp32 -1 $charset "r^?1^?1" -o $path/reverse-prefix-0-99.rule
mp32 -1 $charset "t^?1^?1" -o $path/toggle-prefix-0-99.rule
# Suffix 0-99
mp32 -1 $charset "$?1$?1" -o $path/suffix-0-99.rule
mp32 -1 $charset "l$?1$?1" -o $path/lower-all-suffix-0-99.rule
mp32 -1 $charset "c$?1$?1" -o $path/upper-first-suffix-0-99.rule
mp32 -1 $charset "u$?1$?1" -o $path/upper-all-suffix-0-99.rule
mp32 -1 $charset "d$?1$?1" -o $path/double-word-suffix-0-99.rule
mp32 -1 $charset "f$?1$?1" -o $path/double-word-reflected-suffix-0-99.rule
mp32 -1 $charset "q$?1$?1" -o $path/double-all-character-suffix-0-99.rule
mp32 -1 $charset "r$?1$?1" -o $path/reverse-suffix-0-99.rule
mp32 -1 $charset "t$?1$?1?" -o $path/toggle-suffix-0-99.rule

# Prefix 0-999
mp32 -1 $charset "^?1^?1^?1" -o $path/prefix-0-999.rule
mp32 -1 $charset "l^?1^?1^?1" -o $path/lower-all-prefix-0-999.rule
mp32 -1 $charset "c^?1^?1^?1" -o $path/upper-first-prefix-0-999.rule
mp32 -1 $charset "u^?1^?1^?1" -o $path/upper-all-prefix-0-999.rule
mp32 -1 $charset "d^?1^?1^?1" -o $path/double-word-prefix-0-999.rule
mp32 -1 $charset "f^?1^?1" -o $path/double-word-reflected-prefix-0-999.rule
mp32 -1 $charset "q^?1^?1" -o $path/double-all-character-prefix-0-999.rule
mp32 -1 $charset "r^?1^?1" -o $path/reverse-prefix-0-999.rule
mp32 -1 $charset "t^?1^?1" -o $path/toggle-prefix-0-999.rule
# Suffix 0-999
mp32 -1 $charset "$?1$?1$?1" -o $path/suffix-0-999.rule
mp32 -1 $charset "l$?1$?1$?1" -o $path/lower-all-suffix-0-999.rule
mp32 -1 $charset "c$?1$?1$?1" -o $path/upper-first-suffix-0-999.rule
mp32 -1 $charset "u$?1$?1$?1" -o $path/upper-all-suffix-0-999.rule
mp32 -1 $charset "d$?1$?1$?1" -o $path/double-word-suffix-0-999.rule
mp32 -1 $charset "f$?1$?1$?1" -o $path/double-word-reflected-suffix-0-999.rule
mp32 -1 $charset "q$?1$?1$?1" -o $path/double-all-character-suffix-0-999.rule
mp32 -1 $charset "r$?1$?1$?1" -o $path/reverse-suffix-0-999.rule
mp32 -1 $charset "t$?1$?1$?1" -o $path/toggle-suffix-0-999.rule

exit 0 
