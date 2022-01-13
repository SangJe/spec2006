#!/bin/bash

spec_dir="./spec_src/benchspec/CPU2006"
gem5_dir="/media/0/mainpower4309/gem5_docker/gem5_spec2006/SPEC_2006"

for folder in "${spec_dir}"/*
do  
    if [ -d ${folder} ]; then
        bench=`echo ${folder} | cut -d '/' -f5`
        bench_wo_number=`echo ${bench} | cut -d '.' -f2`
        
        if [ ${bench_wo_number} == "sphinx3" ]; then
            bench_wo_number="sphinx_livepretend"
        elif [ ${bench_wo_number} == "xalancbmk" ]; then
            bench_wo_number="Xalan"
        fi
        gcc_nn="${folder}/exe/${bench_wo_number}_base.amd64-m64-gcc42-nn"
        bin_nn="${folder}/run/build_base_amd64-m64-gcc42-nn.0000/${bench_wo_number}"
        target_dir="${gem5_dir}/${bench_wo_number}"

        cp ${gcc_nn} ${target_dir};
        cp ${bin_nn} ${target_dir};
    fi
done