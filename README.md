
# 3D Object Reconstruction

3D reconstruction of an object is a challenging as well as an exciting task. It involves aligning the images, creating the point clouds and generating the surface. In this project we attempt to reconstruct the object placed in front of the webcam of the laptop. There are several challenges associated with this, we need to make the algorithms fast enough so as to produce real time reconstruction, robust to outliers and also get enough correspondences between the images to be able to get a 3D point cloud.

## Introduction
We take several images of the object placed in front of the webcam of the laptop and then extract correspondences between the images, reconstruct them in 3D world and then recover  the whole surface of the object by interpolating.

## preliminary Work Distribution

Module | Name | Math used |
| --- | --- | --- |
Camera Calibration | Nishant |   SVD / Optimization |
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
###Camera Calibration: 
####Input: 
Set of images of checkerboard patterns  
####Output: 
Camera Matrix  
Distortion Vector if Applicable 
Notes : 

###Feature Extraction: 
####Input: 
Pair of images  
####Output: 
Interest Points  
Resultant image(if Applicable)  
####Notes: 
No need for dense point correspondences, sparse  
features will do 
Need to be accurate so F estimate can be reliable  
 
###Feature Matching: 
####Input: 
Pair of images 
Interest points for image1 
Interest points for image2 
Resultant image1 (output from feature extraction function) 
Resultant image2 
####Output: 
Indexed matching of interest points 

###Fundamental Matrix: 
####Input: 
Feature Correspondences 
####Output: 
F

###Dense Correspondences: 
####Input: 
Pair of images 
Camera Matrix (K) 
####Output: 
Indexed matching 
Essential Matrix  

###Estimating Camera Motion: 
####Input: 
E 
Camera Matrix (K) 
####Output: 
R 
T 

###Subpixel Interpolation: 
####Input: 
Pair of images 
Sobel response if available 
Indexed matching 
E 
####Output: 
Indexed matching at subpixel 

###Interpolation for Surface fitting:  
####Input: 
Pair of images 
Indexed matching at subpixel 
E 
####Output: 
Dense Disparity 

###Triangulation / Reconstruction 
####Input: 
Image1 
Dense Disparity Map 
Camera Matrix (K) 
Fundamental Matrix (F) 
####Output: 
[3D points | RGB color] 

###BA 
####Input: 
Camera Matrix 
[R | T]'s 
####Output: 
Visualization of 3D pointcloud

