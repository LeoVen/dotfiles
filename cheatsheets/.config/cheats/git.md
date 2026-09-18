# git

---

“Transplant” a series of commits

    $ git rebase --onto <dst> <base> <tip>

NOTE: This takes commts `<base>..<tip>` (without `<base>`) and “transplants” them onto commit `<dst>`.
MORE: `man -P "less +/'TRANSPLANTING A TOPIC BRANCH WITH --ONTO'" git-rebase`

---

