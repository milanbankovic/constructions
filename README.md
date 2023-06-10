# Automated triangle ruler-and-compass constructions using constraint solvers

## Introduction

This repository contains a MiniZinc constraint model for solving
triangle ruler-and-compass construction problems from the Wernick's
list. The details of the encoding can be found in the corresponding
paper.

## Organization of the repository

The repository contains the following files:

- model_lin.dzn: a non-optimization variant of the model, suitable for
  checking whether a plan (i.e. a construction) of a given length
  exists. The length is given by maxSteps parameter, whose value
  should be provided in a separate .dzn file (such as maxSteps.dzn
  file provided in this repository).

- model_min.dzn: an optimization variant of the model, suitable for
  checking for a plan of the minimal possible length. The upper limit
  for the number of steps should be still provided by maxSteps
  parameter.

- model_inc.dzn: an optimization variant of the model, where both
  minSteps and maxSteps parameters should be provided. This model is
  suitable for incremental strategy of searching for a plan of the
  minimal length.


- data.dzn: this data file is included from the models by MiniZinc's
  include directive. It contains the database of the geometric
  knowledge needed for solving the problems from the Wernick's list.
  The knowledge is given by the lists of known objects and the
  relations between them, in the form of values of appropriate model
  parameters.

- maxSteps.dzn: for convenience, this file contains an assignment of
  a value to maxSteps parameter

- minSteps.dzn: similar for minSteps parameter

- files of the form X_Y_Z.dzn: these files contain setups for
  particular problems from the Wernick's list (given objects, which
  are always the points X,Y,Z, and goal objects, which are always the
  points A,B,C).

## How to use

To use the model, you should first download the MiniZinc distribution
from:

	https://www.minizinc.org/software.html

After that (or before that), you can get this repository to you computer:

      git clone https://github.com/milanbankovic/constructions

Enter the repository:

      cd constructions/

and invoke the following command for a chosen problem:

    <path_to_minizinc>/bin/minizinc --solver chuffed <model>.mzn maxSteps.dzn [minSteps.dzn] X_Y_Z.dzn

where <model> may be any of the three variants of the model, and
X_Y_Z.dzn may be any of data files for a specific problem. File
minSteps.dzn should be provided only in case of model_inc.mzn. You can
manually edit files maxSteps.dzn and minSteps.dzn to change the upper
(or lower) limit for the number of steps.