
# ${1:3D Object Reconstruction}

3D reconstruction of an object is a challenging as well as an exciting task. It involves aligning the images, creating the point clouds and generating the surface. In this project we attempt to reconstruct the object placed in front of the webcam of the laptop. There are several challenges associated with this, we need to make the algorithms fast enough so as to produce real time reconstruction, robust to outliers and also get enough correspondences between the images to be able to get a 3D point cloud.

## Introduction
We take several images of the object placed in front of the webcam of the laptop and then extract correspondences between the images, reconstruct them in 3D world and then recover  the whole surface of the object by interpolating.

## Proliminary Work Distribution



Camera Calibration | Nishant |   SVD / Optimization |
| --- | --- | --- |
Feature Extraction (Robust) | Nishant |   Differentiation  |
Feature Matching  | Nishant |   Distance (Manhattan etc ) |
Fundamental Matrix Estimation | Nishant |   RANSAC / SVD / EIG / Normalization | 
Dense Correspondence | Harsha |
Estimation motion of camera | Harsha   | RANSAC / SVD / EIG / Optimization |
Match interpolation for subpixel accuracy | Sudeep |   Function Interpolation | 
Triangulation | Sudeep  |  SVD / Optimization |
Interpolation for surface fitting | Sudeep  |  Interpolation / Function estimation |
Bundle Adjustment for computing structure | Harsha |   Optimization |

## Report 
Need to write 5 pages per section 

## Function description
TODO



