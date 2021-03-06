#!/bin/bash

for pre in 1 2
do
    for sm in sm_60 sm_70 # P100 V100
    do
        if [ $pre == 1 ]
        then
            precision=single
        else
            precision=double
        fi

        echo $sm $precision
        nvcc -DPTYCHO_PRECISION=$pre -cubin -arch=$sm -o ./ptycho_${sm}_${precision}.cubin ./core/ptycho/ptycho_precision.cu
    done
done
