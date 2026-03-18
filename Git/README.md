# Git & GitHub

## What to do if something sensitive is accidently pushed

### Important Notes

- **Removing the file is not enough**, credentials need to be taken out of the Git history.
- `.gitignore` will **NOT** fix this, it only prevents future commits. It does **NOT** remove anything that has already been commited.

### Assume it is compromised

Anything like, API keys, passwords, tokens, credentials if pushed are now public and compromised.

### Delete/Change Credentials

Go to the service of the leaked credential and revoke the credential creating a new one in its place.

### Remove from the Git commit

```Bash
git reset --soft HEAD~1
git add .
git commit -m "Remove sensitive data"
git push --force
```

### Add it to .gitignore for the future

Add the file to the `.gitignore` to ensure it is not tracked in the future, and remember to remove it from the cache like so.

```Bash
git rm --cached secrets.txt
git commit -m "Remove secrets"
git push
```