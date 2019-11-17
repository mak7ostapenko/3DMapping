# 3D Mapping Research

Stages of the research:

1. Scene Representation Networks:
	- run models on the custom data;
	- find correlation between nuber of frames and quality of reqonstruction; 
	- play with feature size;
	- find drawbacks of model note them and try to deal;
	- increase speed;
	- decrease number of needed frames for scene rendering;
	- add noise to camera position and try to evaluate it;
2. Geometry-Aware Neural Rendering:
	- ...
3. Optimize networks and pipelines.
3. Evaluation on a real world problem.

---

## Notes

### 1. Scene Representation Networks: Continuous 3D-Structure-Aware Neural Scene Representations

[![Paper](http://img.shields.io/badge/paper-arxiv.1001.2234-B31B1B.svg)](https://arxiv.org/abs/1906.01618)

[Official GitHub repository](https://github.com/vsitzmann/scene-representation-networks)

Scene Representation Networks (SRNs) are a continuous, 3D-structure-aware scene representation that encodes both geometry and appearance.  SRNs represent scenes as continuous functions that map world coordinates to a feature representation of local scene properties. By formulating the image formation as a neural, 3D-aware rendering algorithm, SRNs can be trained end-to-end from only 2D observations, 
without access to depth or geometry. SRNs do not discretize space, smoothly parameterizing scene surfaces, and their memory complexity does not scale directly with scene resolution. 

---

### 2. Geometry-Aware Neural Rendering
[![Paper](http://img.shields.io/badge/paper-arxiv.1911.04554-B31B1B.svg)](https://arxiv.org/abs/1911.04554)

....

---

## Datasets

### NOTE: Datset, coordinate and camera parameter conventions for dataloaders

**Desired dataset structure**:

```
+── train_set
│   +── class_id
│   │   +── pose
│   │   │+── sample_id.txt
│   │   │+── ....
│   │   +── rgb
│   │   │+── sample_id.jpg
│   │   │+── ....
│   │   +──  intrinsics
│   │   │+── sample_id.txt
│   │   │+── ....
│   │   +── intrinsics.txt
│   │
│   +── ....
│ 
+── val_set
│   +── class_id
│   │   +── ...
│   +── ...
│
+── test_set
│   +── class_id
│   │   +── ...
│   +── ...
```

**Matrix of intrinsic camera params**:

```
(fx,  0,  cx)
(0,  fy,  cy)
(0,   0,   1)
```
This code uses an "OpenCV" style camera coordinate system, where the Y-axis points downwards (the up-vector points in the negative Y-direction), 
the X-axis points right, and the Z-axis points into the image plane. Camera poses are assumed to be in a "camera2world" format,
i.e., they denote the matrix transform that transforms camera coordinates to world coordinates.

The code also reads an "intrinsics.txt" file from the dataset directory. This file is expected to be structured as follows (unnamed constants are unused):
```
f cx cy 0.
0. 0. 0.
1.
img_height img_width
```
The focal length, cx and cy are in pixels. Height and width are the resolution of the image.


### 1. Custom

File ***intrinsics.txt*** conteins next elements:

```
Fx Fy Cx Cy
0 0 0 
1
image_height image_width
```

- Need to rename the foler  ***pthoto*** to ***rgb***.
- In order to train the models on dataset you need to create folder ***intrinsics*** for each *class_id* and for each **sample_id** you need generate file **sample_id.txt** with matrix of intrinsic camera params writed in one line:
	```
	Fx 0 Cx 0 Fy Cy 0 0 1
	```

Do next steps to get desired dataset fomat:
1. Give permissions for execution execution:
	```
	chmod +x gen_intrinsics_for_each_sample.sh
	``` 
2. Execute script for each subset and get results:
	```
	$ ./gen_intrinsics_for_each_sample.sh dataset/root/dir
	```

---

### 2. Shepard metzler

...

---

