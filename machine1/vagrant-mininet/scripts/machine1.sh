#!/usr/bin/env bash
echo "----------------------------------------"
echo "running testOfOverlay with controller: "
echo $CONTROLLER
echo $GBPHOST1
echo $GBPHOST2
echo "----------------------------------------"
/tmp/testOfOverlay/testOfOverlay.py --local s1 --controller $CONTROLLER
