#!/bin/bash

limit=100

cliphist list | tail -n +$((limit+1)) | cliphist delete