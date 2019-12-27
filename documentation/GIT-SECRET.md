## git-secret
[git-secret](https://git-secret.io/)stores your files in your git repository encrypted. To that end it uses `git` and `gpg`.

In the chosen repository run `git secret init` to start `git-secret`. To add the first user to the keyring run `git secret tell your@gpg.email`.

To add a file run `git secret add <filename>`, this file must also be mentioned in the `.gitignore` otherwise they cannot be added. 
However if you run the command it will add the file to `.gitignore` automatically.

To add all folder files run `git secret add <folder>/*`.

The run `git secret hide` to encrypt all files added. Always hide before commit, it is advised to add this command to the `pre-commit` hook.

To decrypt the files run `git secret reveal`, or to view the content run `git secret cat <filename>`.
