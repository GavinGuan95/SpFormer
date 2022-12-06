#!/bin/bash
set -x #echo on

python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 2
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 2 3
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 3
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 4
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 5
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 6
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 4 5 6
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 3 4 5 6
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4 5
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4 5 6

python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 2 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 2 3  --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 3 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 4 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 5 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 6 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 4 5 6 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 3 4 5 6 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4 5 --test_votr_only
python test.py --cfg_file cfgs/kitti_models/votr_ssd.yaml --optimizations 1 2 4 5 6 --test_votr_only
