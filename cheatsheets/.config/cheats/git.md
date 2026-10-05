# git

---

“Transplant” a series of commits

    $ git rebase --onto <dst> <base> <tip>

NOTE: This takes commts `<base>..<tip>` (without `<base>`) and “transplants” them onto commit `<dst>`.
MORE: `man -P "less +/'TRANSPLANTING A TOPIC BRANCH WITH --ONTO'" git-rebase`

---

Add changes to a commit in the past. First create a fixup commit with the changes:

    $ git commit --fixup <commit-in-the-past>

Then rebase:

    $ git rebase -i --autosquash <commit-in-the-past>~1

Save and quit. Done.

---

