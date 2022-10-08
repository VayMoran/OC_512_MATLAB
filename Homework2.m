%%
clear
% Question 1
vector_x1 = linspace(6,39,100)

%%
% Question 2
vector_y1 = -3:.25:12;
vector_y1 = vector_y1'

%%
% Question 3
% Create three main vectors
vector_x2 = linspace(0,5,6);
vector_x2_2 = vector_x2*2;
vector_x2_3 = vector_x2*3 + 10;

%Concatenate three vectors into one matrix
matrix_a1 = [vector_x2;vector_x2_2;vector_x2_3]

%%
% Question 4
% Create first "Matrix A" from problem
matrix_a2 = [3 5 9; 6 37 1; 2 8 6]
% Create two vectors for rows 2 and 3 of matrix_a2
vector_c = matrix_a2(3,:)
vector_d = matrix_a2(2,:)
% Create an an array pulling first two colums of matrix_a2
array_e = [matrix_a2(1,1:2);vector_d(1,1:2)]
% Crate an array pulling four corners of matrix_a2
array_e2= [matrix_a2(1,1) matrix_a2(1,3); vector_c(1) vector_c(3)]

%%
% Question 5
matrix_sort_row = sort(matrix_a2,2)
matrix_sort_column = sort(matrix_a2,'descend')

%%
% Question 6
matrix_c = [6 7; 2 9]
matrix_d = [-9 3; 7 5]
% Apply basic math to both matrixes
matrix_add = matrix_c + matrix_d
matrix_c_minus_d = matrix_c - matrix_d
matrix_d_minus_c = matrix_d - matrix_c
matrix_multiply = times(matrix_c,matrix_d)
matrix_c_dividedby_d = matrix_c./matrix_d
matrix_d_dividedby_c = matrix_d./matrix_c
% Create two matricies, with matrix c d concatenated vertically or
% horizontal
matrix_cd_rows_concat = [matrix_c matrix_d]
matrix_cd_column_concat = [matrix_c; matrix_d]

%%
% Question 7
matrix_matlab = [3 9; 8 2]
matrix_simulink = [2;8;5]
cell_array_a = {'Matlab' 'Simulink'; matrix_matlab matrix_simulink}

cell_array_a{1}(4) % Access l in "matlab"
cell_array_a{3} % Access Simulink as character array
cell_array_a(3) % Access Simulink as cell
cell_array_a{2}(2) % Access 8 in first matrix
cell_array_a{4}(2) % Access 8 in second matrix

[name1, name2, array1, array2] = deal(cell_array_a(1), cell_array_a(3), cell_array_a(2), cell_array_a(4))


%%
% Question 8
oc512student(1).firstname='Greg';
oc512student(2).firstname='Mary';
oc512student(1).lastname='Jones';
oc512student(2).lastname='Smith';
oc512student(1).examscore=[96 95];
oc512student(2).examscore=[87 75];

ce640student(1).lastname='Garcia';
ce640student(2).lastname='Morgan';
ce640student(3).lastname='Laham';
ce640student(1).firstname='Alex';
ce640student(2).firstname='Fernando';
ce640student(3).firstname='Sara';
ce640student(1).examscore = [95 90];
ce640student(2).examscore = [67 72];
ce640student(3).examscore = [87 85];

combined_students = [oc512student, ce640student]






