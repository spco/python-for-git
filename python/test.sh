#!/bin/bash

# Parse the result of the previous test, display Pass/Fail result, and increment the counter if need be
function parseresult {
  if [ $? == 0 ] ; then
    echo 'Pass'
  else
    echo 'Fail'
    failcounter=$((failcounter+1))
  fi
}



failcounter=0

# Test 1: supply one data file
python3 first.py words1.dat &> /dev/null
parseresult

# Test 2: supply two data files
python3 first.py words1.dat words2.dat &> /dev/null
parseresult

# Test 3: supply a different data file
python3 first.py words2.dat &> /dev/null
parseresult

# Now check the counter - fail if we've counted any individual test failures
if [ $failcounter -gt 0 ] ; then
  echo $failcounter 'failures!'
  exit 1
else
  echo 'All test passed!'
  exit 0
fi
