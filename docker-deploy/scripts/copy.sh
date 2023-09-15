#! /bin/bash
head -n $1 /data/projects/fate/examples/data/$2.csv >  /data/projects/fate/examples/data/$2-$1.csv
#head -n $1 /data/projects/fate/examples/data/default_credit_hetero_host.csv >  /data/projects/fate/examples/data/default_credit_hetero_host-$1.csv
