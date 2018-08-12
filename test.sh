$TAGNAME = $(curl -s 'https://api.github.com/pterodactyl/daemon/releases/latest' | jq -r '.tag_name')

if grep -Fxq "$TAGNAME" tags.txt
then
    exit 0
else
    $TAGNAME >> tags.txt
    
    body='{
    "request": {
    "branch":"mini"
    }
     "config": {
    "env": {
     "matrix": ["tag=$TAGNAME"]
    },

    }'

    curl -s -X POST \
        -H "Content-Type: application/json" \
       -H "Accept: application/json" \
       -H "Travis-API-Version: 3" \
       -H "Authorization: token ZnOHKt6JzDPgUTUie7UeTg" \
       -d "$body" \
       https://api.travis-ci.com/repo/travis-ci%2Ftravis-core/requests

fi
