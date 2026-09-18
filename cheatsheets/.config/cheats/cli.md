# CLI

## POSIX Utility Syntax Guidelines

---

### Syntax

`[ ]` - item is optional

    $ ls [-l]

`< >` or `ALL_CAPS` - required item

    $ ping <hostname>
    $ ping HOSTNAME

`...` - ellipses means an item is repeatable

    # in this case, it is also optional
    $ zip <zipfile> [file ...]

`|` - pipe means mutual exclusion

    $ top [-a | -d | -e | -c mode]

`( )` - parentheses group items with pipes or ellipses

    $ tar -(c|x|t)f <archive>

`{ }` - curly braces not POSIX standard but often used to group required choices

    $ tar {-t | -x} [options] [patterns]

*Full Example*

    $ mycli [-v | -q] [--config=<file>] <command> [<args>...]

### Flag Convention

*Short Flag* is a single hyphen followed by a single character.

    $ ls -l

If there are multiple, they can be combined.

    $ ls -lah
    # same as
    $ ls -l -a -h

*Long Flag* is two hyphens followed by a word or phrase. These can't be combined.

    $ ls --all

In case of a phrase with multiple words, they are put together with a single hyphen.

    $ ls --only-files
    # same as
    $ ls -f

---

### See Also

- https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html#tag_12_02
- http://docopt.org/

