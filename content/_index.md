---
title: sub
---

<!--
Copyright 2020 Authors of sub

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

**sub** is a bash library to manage a set of commands and sub-commands (like git).  It mandates cli options and help with shflags.

### Requirements

Uses:
- bash
- gnu getopt

Must have `sub`, `shflags`, commands, and sub-commands in path.

### Help content

Option `--help` is handled by `sub`.  The help content is the first contiguous block of comments after the shebang.  The line must be prefixed with a hash and a space, unless it a blank line (which still requires a leading hash).

If the help content starts with `USAGE:` then `sub` won't generate a usage line.

### Example command

In `bin/example`, to be called as `example`:

```
#!/bin/bash

# This is an example

function options {
  DEFINE_string name 'world' "somebody's name" n
}

function main {
  echo "example: ${FLAGS_name:-}: $@"
}

source sub "$0" "$@"
```

### Example sub-command

In `exec/example-a`, to be called as `example a`

```
#!/bin/bash

# USAGE: example a [flags] args
#
# This is another example

function main {
  echo "a: $@"
}

source sub "$0" "$@"
```
