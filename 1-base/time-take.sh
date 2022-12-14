#!/bin/bash
start=$(date +%s)
date
end=$(date +%s)
diff=$(( end - start))
echo diff is $diff
