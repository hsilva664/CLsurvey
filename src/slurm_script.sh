#!/bin/bash

. $HOME/my_cc_scripts/custom_commands.sh
rm -rf data/datasets/tiny-imagenet
cp -r data/datasets/tiny-imagenet_backup ${SLURM_TMPDIR}/tiny-imagenet
ln -s ${SLURM_TMPDIR}/tiny-imagenet data/datasets/tiny-imagenet
CC_MY_SINGULARITY_EXEC pipenv run python -m framework.main --logfile log.txt --gridsearch_name reproduce --method_name HAT --ds_name tiny --lr_grid 1e-1,5e-2,1e-2,5e-3,1e-3,5e-4,1e-4 --boot_lr_grid 1e-1,5e-2,1e-2,5e-3,1e-3,5e-4,1e-4 --test base_VGG9_cl_512_512