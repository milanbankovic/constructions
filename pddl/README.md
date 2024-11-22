# PDDL model

## Introduction

This repository contains a PDDL model for solving triangle
straightedge-and-compass construction problems from the Wernick's
list. The details of the encoding can be found in the corresponding
paper.

## Organization of the repository

The repository contains the following files:

- model.pddl: this file contains a model of the triangle construction
  problem as a planning problem. The file defines object types,
  predicates and actions (i.e. construction step types).

- data.pddl: this file defines the objects and the relations between
  them.

## How to use

To use the model, you should first download and install fast-downward planner:

   https://www.fast-downward.org/

After that (or before that), you can get this repository to your
computer:

      git clone https://github.com/milanbankovic/constructions

Enter the repository:

      cd constructions/pddl

Copy the data file:

     cp data.pddl problem.pddl

Edit `problem.pddl` file by replacing the word `GIVEN` with the
concrete elements of the triangle that are given, such as:

    (constructed A)
    (constructed G)
    (constructed O)

Then run the following commands:

     <path-to-fast-downward>/fast-downward.py --translate model.pddl problem.pddl
     <path-to-fast-downward>/fast-downward.py output.sas --search "astar(lmcut())"

