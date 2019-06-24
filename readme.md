# Final Year Project

This repository contains Final report and the file used during the duration of the project. Below a description can be found on the usage of each file. 


## Usage
The description will go cover the files used chronologically based on the process

1.  The Simulink folder contains the files used to obtain the operating points that can be found in the Datasets folder. 

    1. __"TwoArea_OperatingPointFinder.m"__- Finds operating points based on the ranges for H1,PFR1 and PFR2 given


2. The constrained and unconstrained regression can be produced. 

   1. __"TwoArea_ConstrainedFit.m"__- uses lsqlinear function produce the constrained fit outputting the x values, which results can be found saved in "Constrained regression x values". The constrained regression requires a Vandermonde matrix input which can be produced using the "Python/matrixmaker.py" file that can be imported into Matlab. 

   2. __"Python/regressionH2label.ipynb"__ contained a Juypter notebook export to produce the unconstrained fit, which results can be found in the report. "Python/regressionH2label.py" is the python export which can be run without the Jupyter IDE


3. The test sets that are taken before the training can be found in the datasets folder as sheets within the workbooks. These are used by the trained model to predict a value for H2, which together are run back through the Matlab model __"Simulink/TwoArea_OperatingPointTester.m"__ to obtain the nadir frequencies. 

   1. The __"Simulink/TwoArea_OperatingPointTesterMultipleFiles.m"__ allows multiple files to be run for testing, useful when doing large amount of testing. 


4. Mesh plot can be created using the Matlab file __"Simulink/MeshPlot.m"__, which takes a input of MAT. Multiple plots can placed by running the program again and changing the file input without closing the open graph plot. 


5. (Further testing extension) The H1+H2 plot against PFR1 and PFR2 plot can be found __"H1+H2plots"__ folder, which plots a line H*PFR>k, to confirm points are above the line. This is not part of the project. The thickness of the line can be changed by changing the line width in the code. 


## License

Imperial College London