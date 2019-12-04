#!/bin/bash

wget $(aws s3 presign s3://dannybucket99sss9/test1.txt) -O file1_after_wget
wget $(aws s3 presign s3://dannybucket99sss9/test2.txt) -O file2_after_wget
