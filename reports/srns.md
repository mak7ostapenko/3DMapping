# Research report for: Scene Representation Networks

Results of research.

## 1. Dataset: Shepard Metzler
### 1.1 Overfit on subset
**Target:** overfit model on small subset of data in order to see how behave losses, scores, gradients.

**Results:**

![](images/shepard_overfit_res.png)
![](images/shepard_overfit_depth.png)
![](images/shepard_overfit_grads.png)
![](images/shepard_overfit_total_loss.png)


### 1.2 Train on whole dataset
**Target:** meet with problems during training models on large 3D dataset.

**Results:**

![](images/shepard_whole_val_res.png)
![](images/shepard_whole_total_loss.png)
![](images/shepard_whole_val_psnr.png)
![](images/shepard_whole_val_depth.png)
![](images/shepard_whole_rgb_img_loss.png)

---

## 2. Dataset: Custom

Training is in progress...

### 2.1 Train on whole dataset
**Target:** look how model perfor 3D mapping in more complex environment.

**Results:**

- If compare with training on whole Shepard Metzler dataset it is obvious that training is less stable. It's probably because here is less images and more complex environment. Possible solution: increase dataset and increase size of models.
![](images/custom_whole_total_loss.png)
![](images/custom_whole_val_psnr.png)
![](images/custom_whole_rgb_img_loss.png)
![](images/custom_whole_val_res.png)


