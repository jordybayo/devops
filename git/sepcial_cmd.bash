# remove prev commit and previous changement
git reset --hard HEAD~1

# to reset hard remote version
git push --force

# remove latest commit but leave the changements
git reset --soft HEAD~1
git reset HEAD~1

# put new commit into the previous one without create new commit
git commit --amend

# creates a new commit to revert the old commit's changes
git revert <commit hash>

# 

