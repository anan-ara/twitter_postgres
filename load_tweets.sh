files='
test-data.zip
'

for file in $files; do
    # call the load_tweets.py file to load data into pg_normalized
    :
done

for file in $files; do
    unzip -p test-data.zip | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:11136/ -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
    # use SQL's COPY command to load data into pg_denormalized
done
