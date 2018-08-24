Image carving

This project we will focus on the concepts of image resizing utilizing the principals supporting minimum-energy seam carving and dynamic programming. The goal of this part of the project is to understand an important approach towards resizing images while attempting to preserve the integrity of important image information. 

We will be performing shrinking an image (making it smaller), by sequentially removing vertical seams of minimum energy. 
 
We begin by computing the energy map.

Though the ideas applied towards enlarging an image are very similar to those of shrinking one. The image shrinking will be achieved by sequentially removing vertical seams of minimum cumulative energy E. The optimal vertical seam (in the sense of minimum cumulative energy) can be found using dynamic programming. The first step is to traverse the image from the second row to the last row and compute the cumulative minimum energy  for all possible connected seams for each entry  (i, j).

At the end of this process, the minimum value of the last row in will indicate the end of the minimal connected vertical seam. Note that we have to record a backtrack table along the way. Hence, in the second step we backtrack from this minimum entry on to find the path of the optimal seam. Also, in order to maintain consistency, if the minimum value is found at multiple indices, choose the smaller index. Finally, this process is iterated several times, as many as indicated by the input argument N.
