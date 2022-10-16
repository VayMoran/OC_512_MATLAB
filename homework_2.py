# -*- coding: utf-8 -*-
import numpy

"""
Question 1: Use a method of your choice to create the row vector x having 100 regularly
spaced values starting exactly at 6 and ending exactly at 39.
"""
vector_x1 = numpy.linspace(6,39,100)
print(vector_x1)

"""
Question 2: Use a method of your choice to create the column vector y having a regular
spacing of 0.25 starting at -3 and ending at 12.
"""

vector_y1 = numpy.arange(-3,12.25, 0.25)
print(vector_y1)
vector_y2 = vector_y1.reshape(-1,1)
print(vector_y2)

"""
Question 3: Create a vector x having six values starting at 0 and ending at 5. Create a matrix A
whose first row is x, second row is 2x and third row is 3x + 10.
"""

vector_x2 = numpy.linspace(0,5,6)
vector_x2_2 = vector_x2 * 2
vector_x2_3 = vector_x2 * 3 + 10
matrix_a1 = numpy.array([[vector_x2],[vector_x2_2],[vector_x2_3]])
print(matrix_a1)

"""
Question 4: Create the matrix 𝐴 = [3 5 9; 6 37 1; 2 8 6]. 
For all of the following tasks, use matrix
addressing and subsetting. Do not simply re-type the portions of the matrix that I
am asking you for. Create the vector c that consists of the third row of A. Create
the vector d that consists of the second column of A. Create a 1x2 array e that
consists of the first and second rows of A. Create a 2x2 array that consists of the 4
corner elements of A. 
"""

matrix_a2 = numpy.array([[3, 5, 9],[6, 37, 1],[2, 8, 6]])
vector_c = matrix_a2[2]
vector_d = matrix_a2[1]

array_e1 = numpy.concatenate([matrix_a2[0][0]],[vector_d[0]])

print (matrix_a2)
print (array_e1)