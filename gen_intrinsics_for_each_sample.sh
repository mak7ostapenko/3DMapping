#!/bin/bash

dataset_dir=$1
echo "Dataset root dir = $dataset_dir"

for class_dir in $dataset_dir*
do
    # for each instance rename photo dir to rgb
    mv $class_dir/photo $class_dir/rgb
    
    # create dir for intrinsics
    mkdir "${class_dir}/intrinsics"

    for sample_img_path in ${class_dir}/rgb/*
    do
	sample_img="${sample_img_path##*/}"
	sample_name="${sample_img%.*}"
        
	# create empty file for the sample
	intrinsics_sample_path="${class_dir}/intrinsics/${sample_name}.txt"
        touch $intrinsics_sample_path
        
	# get first line from class intrinsics file
	# line format: Fx Fy Cx Cy
	first_line=$(head -n 1 $"${class_dir}/intrinsics.txt")
	
	params_array=( )
        for coef in $first_line
	do
	    params_array+=($coef )
        done

	# format into: Fx 0 Cx 0 Fy Cy 0 0 1
	lined_intrinsics_matrix="${params_array[0]} 0.0 ${params_array[2]} 0.0 ${params_array[1]} ${params_array[3]} 0.0 0.0 1.0"
	
	echo $lined_intrinsics_matrix > $intrinsics_sample_path
    done
done



