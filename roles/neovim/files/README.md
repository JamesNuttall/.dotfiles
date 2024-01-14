## Fugitive
I always forget how to handle merge conflits with fugitive:

`:GvdiffSplit!`
This will open a three way split:
```
| Target Branch //2 | Working Copy | Merge Branch //3 |
```

You can then use `:diffget //2` or `:diffget //3` to get changes from the respective target or merge branch into the working copy. Similary you can use `:diffput //1` to work opposite moving work from target or merge into the working copy.
`:GWrite` will write the changes.
