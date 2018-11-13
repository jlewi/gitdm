#!/bin/sh
cp github_users.json github_users.old

# Delete github_users.json so we recompute it.
rm -f github_users.json

# To reuse all data (repo metadata, commits, users)
ruby ghusers.rb
# To force fetch new commits (it will reuse repos metadata & users)
# 1st arg is: 'r' - force repos metadata fetch, 'c' - force commits fetch, 'u' force users fetch
#
# TODO(jlewi): I think we need to use -c option to redownload latest commits.
# ruby ghusers.rb c
# ruby ghusers.rb rcu
./encode_emails.rb github_users.json temp
mv temp github_users.json
