include "globals.mzn";
% PARAMETERS

enum Point; % All considered points
enum Line;  % All considered lines
enum Circle; % All considered circles
enum Angle; % All considered angles

% The following parameters are based on our assumptions

array [Point] of set of Point: coincident_points; % Points that coincide with a given point

array [Line] of set of Line: coincident_lines; % Lines that coincide with a given line

array [Circle] of set of Circle: coincident_circles; % Circles that coincide with a given circle

array [Point] of set of Line: inc_lines; % Lines incident with a given point
                                                                                                                                                                                     
array [Line] of set of Line: perp_lines; % Lines perpendicular to a given line

array [Line] of set of Line: parallel_lines; % Lines parallel to a given line

array [Point] of set of Circle: inc_circles; % Circles incident with a given point

array [Circle] of opt Point: circle_center; % Center of a given circle (if known)

array [Circle, 1..2] of opt Point: circle_diameter; % End-points of a diameter of a given circle (if known)

array [Circle] of set of Line: tangent_lines;  % Lines that are tangents of a given circle

int: numOfKRTriples;
array [1..numOfKRTriples, 1..3] of Point: known_ratio_triples;  

int: numOfKRQuadruples;
array [1..numOfKRQuadruples, 1..4] of Point: known_ratio_quadruples;

type AngleDef = tuple(Line, Line, set of Angle);

int: numOfAngleDefs;

array [1..numOfAngleDefs] of AngleDef: angle_defs;

int: numOfPerpBisectors;

type PerpBisector = tuple (Point, Point, Line);

array [1..numOfPerpBisectors] of PerpBisector: perp_bisectors;

int: numOfHQuadruples;

type Quadruple = tuple(Point, Point, Point, Point);

array [1..numOfHQuadruples] of Quadruple: harmonic_quadruples;

type HomothetyTriple = tuple (Point, Line, Line);

int: numOfHomothetyTriples;

array [1..numOfHomothetyTriples] of HomothetyTriple: homothety_triples;

type LocusDef = tuple (Point, Point, Angle, Circle);
int: numOfLocusDefs;
array [1..numOfLocusDefs] of LocusDef: locus_defs;

% Is circle k the locus of points such that XY is seen at angle f(fi)
predicate is_locus(var Point: X, var Point: Y, var Angle: fi, var Circle: k) = 
 let { array[int] of var int: L = sort([X,Y]); } in exists(i in 1..numOfLocusDefs) (locus_defs[i].1 = L[1] /\ locus_defs[i].2 = L[2] /\ locus_defs[i].3 = fi /\ locus_defs[i].4 = k);

% Is ratio XZ/ZY is known?
predicate known_ratio3(var Point: X, var Point: Y, var Point: Z) = 
  let { array[int] of var int: S = sort([X,Y,Z]); } in  exists(i in 1..numOfKRTriples) (forall(j in 1..3) (S[j] = known_ratio_triples[i,j]));
                                     
% Is ratio XY/ZW is known?
predicate known_ratio4(var Point: X, var Point: Y, var Point: Z, var Point: W) = 
  let { array[int] of var int: S = sort([X,Y,Z,W]); } in exists(i in 1..numOfKRQuadruples) (forall(j in 1..4) (S[j] = known_ratio_quadruples[i,j]));                                                                                     
                                                                                                                                                                                              
% Is the angle between lines p and q is computable using the angles constructed so far? 
predicate computable_angle(var Line: p, var Line: q, var set of Angle: known_angles) = 
       let { array[int] of var int: L = sort([p, q]); } in exists(i in 1..numOfAngleDefs) (L[1] = angle_defs[i].1 /\ L[2] = angle_defs[i].2 /\ forall(a in angle_defs[i].3) (a in known_angles));
               
% Is the angle a computable using the angle between the lines p and q?
predicate obtainable_angle(var Line: p, var Line: q, var Angle: a) = 
       let { array[int] of var int: L = sort([p, q]); } in exists(i in 1..numOfAngleDefs) (L[1] = angle_defs[i].1 /\ L[2] = angle_defs[i].2 /\ angle_defs[i].3 = { a });

% Is the segment XY a diameter of the circle C?
predicate is_diameter(var Point: X, var Point: Y, var Circle: C) = 
     let { array[int] of var int: L = sort([X,Y]); } in forall(i in 1..2) (occurs(circle_diameter[C,i]) /\ L[i] = deopt(circle_diameter[C,i]));

predicate is_perp_bisector(var Point: X, var Point: Y, var Line: p) = 
    let { array[int] of var int: L = sort([X,Y]); } in exists(i in 1..numOfPerpBisectors) (perp_bisectors[i].1 = L[1] /\  perp_bisectors[i].2 = L[2] /\ perp_bisectors[i].3 = p);

% Negation of the previous predicate (not is_perp_bisector() does not work because of the let expression)
predicate is_not_perp_bisector(var Point: X, var Point: Y, var Line: p) = 
    let { array[int] of var int: L = sort([X,Y]); } in forall(i in 1..numOfPerpBisectors) (perp_bisectors[i].1 != L[1]  \/ perp_bisectors[i].2 != L[2] \/ perp_bisectors[i].3 != p);

% Is H(X,Y,Z,W) (in any order of points) ?
predicate are_harmonic(var Point: X, var Point: Y, var Point: Z, var Point: W) = 
    let { array[int] of var int: L = sort([X,Y,Z,W]); } in exists(i in 1..numOfHQuadruples) (harmonic_quadruples[i].1 = L[1] /\ harmonic_quadruples[i].2 = L[2] /\ harmonic_quadruples[i].3 = L[3] /\ harmonic_quadruples[i].4 = L[4]);
    
% Is line q the image of line p by homothety with the center X (and any coeficient)?    
predicate is_homothety(var Point: X, var Line: p, var Line: q) = 
   let { array[int] of var int: L = sort([p,q]); } in exists(i in 1..numOfHomothetyTriples) (homothety_triples[i].1 = X /\ homothety_triples[i].2 = L[1] /\ homothety_triples[i].3 = L[2]);      

%Supported types of construction steps                                                                           
enum ConsType =  { LineThrough,
                                    LineIntersect,
                                    KnownRatio3,  
                                    KnownRatio4,  
                                    PerpendicularLine,
                                    ParallelLine,                                 
                                    CircleCenterPoint, 
                                    CircleCenterTangent,
                                    TangentCirclePoint,
                                    TangentsCirclePoint,
                                    LineCircleIntersects,
                                    LineCircleIntersect,
                                    LineCircleIntersect2,
                                    CircleIntersects,
                                    CircleIntersect,
                                    AngleObtained,
                                    LineFromAngle,
                                    CenterThreePoints,
                                    CenterTwoPointsAndLine,
                                    CircleOverSegment,
                                    PerpendicularBisector,
                                    HarmonicQuadruple,
                                    Homothety,
                                    Locus,
                                    };

int : maxSteps; % max num of steps (parameter)

int : minSteps;

% The given set of points
set of Point: given_points;

% The given set of lines
set of Line: given_lines;

% The given set of circles
set of Circle: given_circles;

% The given set of angles
set of Angle: given_angles;

% The set of points that should be constructed
set of Point: goal_points;

% The set of lines that should be constructed
set of Line: goal_lines;

% The set of circles that should be constructed
set of Circle: goal_circles;

% The set of angles that should be constructed
set of Angle: goal_angles;

% Maximal number of points involved in one construction step
int: maxPoints;

% Maximal number of lines involved in one construction step
int: maxLines;

% Maximal number of circles involved in one construction step
int: maxCircles;

% Maximal number of angles involved in one construction step
int: maxAngles;

include "data.dzn";

% VARIABLES

% known_points[i] is the set of points known after i-th step
array [0..maxSteps] of var set of Point: known_points;

% known_lines[i] is the set of lines known after i-th step
array [0..maxSteps] of var set of Line: known_lines;

% known_circles[i] is the set of circles known after i-th step
array[0..maxSteps] of var set of Circle: known_circles;

% known_angles[i] is the set of angles known after i-th step
array[0..maxSteps] of var set of Angle: known_angles;


% Initial setup
constraint known_points[0] = given_points;
constraint known_lines[0] = given_lines;
constraint known_circles[0] = given_circles;  
constraint known_angles[0] = given_angles;
  
% construct[i] is the type of construction used in i-th step
array [1..maxSteps] of var ConsType: construct;



% points[i, j] is the j-th point used in i-th step (don't care if not used)
array [1..maxSteps, 1..maxPoints] of var Point : points;

% lines[i,j] is the j-th line used in i-th step (don't care if not used)
array [1..maxSteps, 1..maxLines] of var Line: lines;

% circles[i,j] is the j-th circle used in i-th step (don't care if not used)
array[1..maxSteps, 1..maxCircles] of var Circle: circles;

% angles[i,j] is the j-th angle used in i-th step (don't care if not used)
array[1..maxSteps, 1..maxAngles] of var Angle: angles;

var minSteps..maxSteps: n;  % actual number of steps (this variable is minimized)

% The following constraints describe the semantics of particular construction step types

% AngleObtained: Line1 x Line2 x Point1 -> Angle1
constraint forall(i in 1..n)
(
  construct[i] = AngleObtained -> (lines[i,1] in known_lines[i-1] /\
                                                        lines[i,2] in known_lines[i-1] /\
                                                        points[i,1] in known_points[i-1] /\
                                                        lines[i,1] in inc_lines[points[i,1]] /\
                                                        lines[i,2] in inc_lines[points[i,1]] /\
                                                        obtainable_angle(lines[i,1], lines[i,2], angles[i,1]) /\
                                                        not (angles[i,1] in known_angles[i-1]) /\
                                                        known_angles[i] = known_angles[i-1] union { angles[i,1] } /\
                                                        known_points[i] = known_points[i-1] /\
                                                        known_lines[i] = known_lines[i-1] /\
                                                        known_circles[i] = known_circles[i-1]
                                                       )
);

% W01a: KnownRatio3: Point1 x Point2 -> Point3
constraint forall(i in 1..n)
(
  construct[i] = KnownRatio3 -> (points[i,1] in known_points[i-1] /\
                                                      points[i,2] in known_points[i-1] /\
                                                      %lines[i,1] in known_lines[i-1] /\
                                                      %lines[i,1] in inc_lines[points[i,1]] /\
                                                      %lines[i,1] in inc_lines[points[i,2]] /\
                                                      known_ratio3(points[i,1], points[i,2], points[i,3]) /\
                                                      not (points[i, 3] in known_points[i-1]) /\
                                                      known_points[i] = known_points[i -1] union { points[i, 3] } /\
                                                      known_lines[i] = known_lines[i - 1] /\
                                                      known_circles[i] = known_circles[i - 1] /\
                                                      known_angles[i] = known_angles[i - 1]
                                                     )

);

% W01b: KnownRatio4: Point1 x Point2 x Point3 -> Point4
constraint forall(i in 1..n)
(
  construct[i] = KnownRatio4 -> (points[i,1] in known_points[i-1] /\
                                                      points[i,2] in known_points[i-1] /\
                                                      points[i,3] in known_points[i-1] /\
                                                      %lines[i,1] in known_lines[i-1] /\ 
                                                      %lines[i,2] in known_lines[i-1] /\
                                                      %lines[i,1] in inc_lines[points[i,1]] /\
                                                      %lines[i,1] in inc_lines[points[i,2]] /\
                                                      %lines[i,2] in inc_lines[points[i,3]] /\
                                                      %lines[i,2] in inc_lines[points[i,4]] /\
                                                      known_ratio4(points[i,1], points[i,2], points[i,3], points[i,4]) /\
                                                      not (points[i, 4] in known_points[i-1]) /\
                                                      known_points[i] = known_points[i -1] union { points[i, 4] } /\
                                                      known_lines[i] = known_lines[i - 1] /\
                                                      known_circles[i] = known_circles[i -1] /\
                                                      known_angles[i] = known_angles[i - 1]
                                                     )

);

% W02: LineThrough: Point1 x Point2 -> Line1
constraint forall(i in 1..n)
(
   construct[i] = LineThrough -> (points[i,1] in known_points[i-1] /\
                                                     points[i,2] in known_points[i-1] /\
                                                     not (points[i,1] in coincident_points[points[i,2]]) /\
                                                     lines[i,1] in inc_lines[points[i,1]] /\
                                                     lines[i,1] in inc_lines[points[i,2]] /\
                                                     not (lines[i,1] in known_lines[i-1]) /\
                                                     known_lines[i] = known_lines[i-1] union { lines[i,1] } /\
                                                     known_points[i] = known_points[i-1] /\
                                                     known_circles[i] = known_circles[i-1] /\
                                                     known_angles[i] = known_angles[i - 1]
                                                     )
);

% W03: LineIntersect: Line1 x Line2 -> Point1
constraint forall(i in 1..n) 
 (
    construct[i] = LineIntersect -> (lines[i, 1] in known_lines[i-1] /\ 
                                                       lines[i, 2] in known_lines[i -1] /\
                                                       not (lines[i,1] in coincident_lines[lines[i,2]]) /\
                                                       not (lines[i, 1] in parallel_lines[lines[i, 2]]) /\
                                                       lines[i, 1] in inc_lines[points[i,1]] /\                                      
                                                       lines[i, 2] in inc_lines[points[i,1]] /\
                                                       not (points[i, 1] in known_points[i-1]) /\ 
                                                       known_points[i] = known_points[i-1] union { points[i, 1] } /\
                                                       known_lines[i] = known_lines[i-1] /\
                                                       known_circles[i] = known_circles[i-1] /\
                                                       known_angles[i] = known_angles[i - 1]
                                                       )   
 );

% W04:   LineCircleIntersects: Line1 x Circle1 -> Point1, Point2
constraint forall(i in 1..n) 
 (
    construct[i] = LineCircleIntersects -> (lines[i,1] in known_lines[i-1] /\
                                                                  circles[i,1] in known_circles[i-1] /\
                                                                  lines[i,1] in inc_lines[points[i,1]] /\
                                                                  lines[i,1] in inc_lines[points[i,2]] /\
                                                                  circles[i,1] in inc_circles[points[i,1]] /\
                                                                  circles[i,1] in inc_circles[points[i,2]] /\
                                                                  not (points[i,1] in coincident_points[points[i,2]]) /\
                                                                  not (points[i,1] in known_points[i-1]) /\
                                                                  not (points[i,2] in known_points[i-1]) /\
                                                                  known_points[i] = known_points[i-1] union { points[i,1], points[i,2] } /\
                                                                  known_lines[i] = known_lines[i-1] /\
                                                                  known_circles[i] = known_circles[i-1] /\
                                                                  known_angles[i] = known_angles[i - 1]
                                                                 )

);

% W05: LineCircleIntersect: Line1 x Circle1 x Point1 -> Point2
constraint forall(i in 1..n) 
 (
    construct[i] = LineCircleIntersect -> (lines[i,1] in known_lines[i-1] /\
                                                                circles[i,1] in known_circles[i-1] /\
                                                                points[i,1] in known_points[i-1] /\
                                                                lines[i,1] in inc_lines[points[i,1]] /\
                                                                lines[i,1] in inc_lines[points[i,2]] /\
                                                                circles[i,1] in inc_circles[points[i,1]] /\
                                                                circles[i,1] in inc_circles[points[i,2]] /\
                                                                not (points[i,1] in coincident_points[points[i,2]]) /\
                                                                not (points[i,2] in known_points[i-1]) /\
                                                                known_points[i] = known_points[i-1] union { points[i,2] } /\
                                                                known_lines[i] = known_lines[i-1] /\
                                                                known_circles[i] = known_circles[i-1] /\
                                                                known_angles[i] = known_angles[i - 1]
                                                               )

);

% W05b: LineCircleIntersect2: Line1 x Circle1 -> Point1
constraint forall(i in 1..n) 
 (
    construct[i] = LineCircleIntersect2 -> (lines[i,1] in known_lines[i-1] /\
                                                                   circles[i,1] in known_circles[i-1] /\
                                                                   lines[i,1] in inc_lines[points[i,1]] /\
                                                                   circles[i,1] in inc_circles[points[i,1]] /\
                                                                   not (points[i,1] in known_points[i-1]) /\
                                                                   known_points[i] = known_points[i-1] union { points[i,1] } /\
                                                                   known_lines[i] = known_lines[i-1] /\
                                                                   known_circles[i] = known_circles[i-1] /\
                                                                   known_angles[i] = known_angles[i - 1]
                                                                  )

);

% W06: CircleCenterPoint: Point1 x Point2 -> Circle1
constraint forall(i in 1..n)
(
   construct[i] = CircleCenterPoint -> (points[i, 1] in known_points[i-1] /\
                                                              points[i, 2] in known_points[i-1] /\
                                                              occurs(circle_center[circles[i,1]]) /\
                                                              deopt(circle_center[circles[i, 1]]) = points[i, 1] /\
                                                              circles[i,1] in inc_circles[points[i,2]]  /\
                                                              not (circles[i,1] in known_circles[i-1]) /\
                                                              known_circles[i] = known_circles[i-1] union { circles[i,1] } /\
                                                              known_points[i] = known_points[i-1] /\
                                                              known_lines[i] = known_lines[i-1] /\
                                                              known_angles[i] = known_angles[i - 1]
                                                             )

);

% W07: CircleIntersects: Circle1 x Circle2 -> Point1, Point2
constraint forall(i in 1..n)
(
   construct[i] = CircleIntersects -> (circles[i, 1] in known_circles[i-1] /\
                                                         circles[i, 2] in known_circles[i-1] /\
                                                         not (circles[i, 1] in coincident_circles[circles[i,2]]) /\
                                                         circles[i, 1] in inc_circles[points[i,1]] /\
                                                         circles[i, 1] in inc_circles[points[i,2]] /\
                                                         circles[i, 2] in inc_circles[points[i,1]] /\
                                                         circles[i, 2] in inc_circles[points[i,2]] /\
                                                         not (points[i,1] in coincident_points[points[i,2]]) /\
                                                         not (points[i,1] in known_points[i-1]) /\
                                                         not (points[i,2] in known_points[i-1]) /\
                                                         known_points[i] = known_points[i-1] union { points[i,1], points[i,2] } /\
                                                         known_lines[i] = known_lines[i-1] /\
                                                         known_circles[i] = known_circles[i-1] /\
                                                         known_angles[i] = known_angles[i - 1]
                                                         )
   
 );

% W08: CircleIntersect: Circle1 x Circle2, Point1 --> Point2
constraint forall(i in 1..n)
(
   construct[i] = CircleIntersect -> (circles[i, 1] in known_circles[i-1] /\
                                                          circles[i, 2] in known_circles[i-1] /\
                                                          points[i,1] in known_points[i-1] /\
                                                          not (circles[i, 1] in coincident_circles[circles[i,2]]) /\
                                                          circles[i, 1] in inc_circles[points[i,1]] /\
                                                          circles[i, 1] in inc_circles[points[i,2]] /\
                                                          circles[i, 2] in inc_circles[points[i,1]] /\
                                                          circles[i, 2] in inc_circles[points[i,2]] /\
                                                          not (points[i,1] in coincident_points[points[i,2]]) /\
                                                         not (points[i,2] in known_points[i-1]) /\
                                                         known_points[i] = known_points[i-1] union { points[i,2] } /\
                                                         known_lines[i] = known_lines[i-1] /\
                                                         known_circles[i] = known_circles[i-1] /\
                                                         known_angles[i] = known_angles[i - 1]
                                                         )
   
 );

% W09: CircleOverSegment: Point1 x Point2 -> Circle1
constraint forall(i in 1..n)
(
  construct[i] = CircleOverSegment -> (points[i,1] in known_points[i-1] /\
                                                                points[i,2] in known_points[i-1] /\
                                                                not (points[i,1] in coincident_points[points[i,2]]) /\
                                                                circles[i,1] in inc_circles[points[i,1]]  /\
                                                                circles[i,1] in inc_circles[points[i,2]] /\
                                                                is_diameter(points[i,1], points[i,2], circles[i,1]) /\
                                                                not (circles[i,1] in known_circles[i-1]) /\
                                                                known_circles[i] = known_circles[i-1] union { circles[i,1] } /\
                                                                known_points[i] = known_points[i-1] /\
                                                                known_lines[i] = known_lines[i-1] /\
                                                                known_angles[i] = known_angles[i-1]  
                                                               )

);

% W10: PerpendicularLine Line1 x Point1 -> Line2
constraint forall(i in 1..n)
(
   construct[i] = PerpendicularLine -> (lines[i,1] in known_lines[i-1] /\
                                                              points[i,1] in known_points[i-1] /\
                                                              lines[i,2] in inc_lines[points[i, 1]] /\
                                                              lines[i,1] in perp_lines[lines[i,2]] /\
                                                              not (lines[i,2] in known_lines[i-1]) /\
                                                              known_lines[i] = known_lines[i-1] union { lines[i,2] } /\
                                                              known_points[i] = known_points[i-1] /\
                                                              known_circles[i] = known_circles[i-1] /\
                                                              known_angles[i] = known_angles[i - 1]
                                                              )
);

% W11: CircleCenterTangent: Point1 x Line1 -> Circle1
constraint forall(i in 1..n)
(
  construct[i] = CircleCenterTangent -> (points[i,1] in known_points[i-1] /\
                                                                  lines[i,1] in known_lines[i-1] /\
                                                                  not (lines[i,1] in inc_lines[points[i,1]]) /\
                                                                  lines[i,1] in tangent_lines[circles[i,1]] /\
                                                                  occurs(circle_center[circles[i,1]]) /\
                                                                  points[i,1] = deopt(circle_center[circles[i,1]]) /\
                                                                  not (circles[i,1] in known_circles[i-1]) /\
                                                                  known_circles[i] = known_circles[i-1] union { circles[i,1] } /\
                                                                  known_points[i] = known_points[i-1] /\
                                                                  known_lines[i] = known_lines[i-1]  /\
                                                                  known_angles[i] = known_angles[i - 1]
                                                                )
);

% W12: TangentsCirclePoint: Circle1 x Point1 --> Line1, Line2
constraint forall(i in 1..n)
(
  construct[i] = TangentsCirclePoint -> (circles[i,1] in known_circles[i-1] /\
                                                                points[i,1] in known_points[i-1] /\
                                                                lines[i,1] in tangent_lines[circles[i,1]] /\
                                                                lines[i,1] in inc_lines[points[i,1]] /\
                                                                lines[i,2] in tangent_lines[circles[i,1]] /\
                                                                lines[i,2] in inc_lines[points[i,1]] /\
                                                                not(lines[i,1] in coincident_lines[lines[i,2]]) /\
                                                                not (lines[i,1] in known_lines[i-1]) /\
                                                                not (lines[i,2] in known_lines[i-1]) /\
                                                               known_lines[i] = known_lines[i-1] union { lines[i,1], lines[i,2] } /\
                                                               known_points[i] = known_points[i-1] /\
                                                               known_circles[i] = known_circles[i-1]  /\
                                                               known_angles[i] = known_angles[i - 1]
                                                              )
);

% W13: TangentCirclePoint:  Circle1 x Point1 x Line1 -> Line2
constraint forall(i in 1..n)
(
  construct[i] = TangentCirclePoint -> (circles[i,1] in known_circles[i-1] /\
                                                               points[i,1] in known_points[i-1] /\
                                                               lines[i,1] in known_lines[i-1] /\
                                                               lines[i,1] in tangent_lines[circles[i,1]] /\
                                                               lines[i,1] in inc_lines[points[i,1]] /\
                                                               lines[i,2] in tangent_lines[circles[i,1]] /\
                                                               lines[i,2] in inc_lines[points[i,1]] /\
                                                               not(lines[i,1] in coincident_lines[lines[i,2]]) /\
                                                               not (lines[i,2] in known_lines[i - 1]) /\
                                                               known_lines[i] = known_lines[i-1] union { lines[i,2] } /\
                                                               known_points[i] = known_points[i-1] /\
                                                               known_circles[i] = known_circles[i-1]  /\
                                                               known_angles[i] = known_angles[i - 1]
                                                              )
);

% W14: PerpendicularBisector: Point1 x Point2 -> Line1
constraint forall(i in 1..n)
(
   construct[i] = PerpendicularBisector -> (points[i,1] in known_points[i-1] /\
                                                                     points[i,2] in known_points[i-1] /\
                                                                     not (points[i,2] in coincident_points[points[i,1]]) /\
                                                                     is_perp_bisector(points[i,1],points[i,2],lines[i,1]) /\
                                                                     not (lines[i,1] in known_lines[i-1]) /\
                                                                     known_lines[i] = known_lines[i-1] union { lines[i,1] } /\
                                                                     known_points[i] = known_points[i-1] /\
                                                                     known_circles[i] = known_circles[i-1]  /\
                                                                     known_angles[i] = known_angles[i - 1]
                                                                     )

);

% W15: Homothety: Point1 x Line1 -> Line2
constraint forall(i in 1..n)
(
   construct[i] = Homothety -> (points[i,1] in known_points[i-1] /\
                                                    lines[i,1] in known_lines[i-1] /\
                                                    not (lines[i,2] in known_lines[i-1]) /\
                                                    is_homothety(points[i,1], lines[i,1], lines[i,2]) /\
                                                    known_lines[i] = known_lines[i-1] union { lines[i,2] } /\
                                                    known_points[i] = known_points[i-1] /\
                                                    known_circles[i] = known_circles[i-1]  /\
                                                    known_angles[i] = known_angles[i - 1]
                                                   )
);
% W16: ParallelLine: Line1 x Point1 -> Line2
constraint forall(i in 1..n)
(
   construct[i] = ParallelLine -> (lines[i,1] in known_lines[i-1] /\
                                                    points[i,1] in known_points[i-1] /\
                                                    lines[i,2] in inc_lines[points[i, 1]] /\
                                                    lines[i,1] in parallel_lines[lines[i,2]] /\
                                                    not (lines[i,2] in known_lines[i-1]) /\
                                                    known_lines[i] = known_lines[i-1] union { lines[i,2] } /\
                                                    known_points[i] = known_points[i-1] /\
                                                    known_circles[i] = known_circles[i-1] /\
                                                    known_angles[i] = known_angles[i - 1]
                                                    )
);

% W17: LineFromAngle: Line1 x Point1 -> Line2
constraint forall(i in 1..n)
(
  construct[i] = LineFromAngle -> (lines[i,1] in known_lines[i-1] /\
                                                        points[i,1] in known_points[i-1] /\
                                                        lines[i,1] in inc_lines[points[i,1]] /\
                                                        lines[i,2] in inc_lines[points[i,1]] /\
                                                        computable_angle(lines[i,1], lines[i,2], known_angles[i-1]) /\
                                                        not (lines[i,2] in known_lines[i-1]) /\
                                                        known_angles[i] = known_angles[i-1] /\
                                                        known_points[i] = known_points[i-1] /\
                                                        known_lines[i] = known_lines[i-1] union {lines[i,2] } /\
                                                        known_circles[i] = known_circles[i-1]
                                                       )
);

% W19: HarmonicQuadruple: Point1 x Point2 x Point3 -> Point4
constraint forall(i in 1..n)
( 
   construct[i] = HarmonicQuadruple -> (points[i,1] in known_points[i-1] /\
                                                                  points[i,2] in known_points[i-1] /\
                                                                  points[i,3] in known_points[i-1] /\
                                                                  not (points[i,2] in coincident_points[points[i,1]]) /\
                                                                  not (points[i,3] in coincident_points[points[i,1]]) /\
                                                                  not (points[i,3] in coincident_points[points[i,2]]) /\ 
                                                                  not (points[i,4] in known_points[i-1]) /\
                                                                  are_harmonic(points[i,1], points[i,2], points[i,3], points[i,4]) /\ 
                                                                  known_points[i] = known_points[i-1] union { points[i,4] } /\
                                                                  known_lines[i] = known_lines[i-1] /\
                                                                  known_circles[i] = known_circles[i-1] /\
                                                                  known_angles[i] = known_angles[i-1]
                                                                  )
);

% W20: Locus: Point1 x Point2 x Angle1 -> Circle1
constraint forall(i in 1..n)
( 
   construct[i] = Locus -> (points[i,1] in known_points[i-1] /\
                                           points[i,2] in known_points[i-1] /\
                                          not (points[i,2] in coincident_points[points[i,1]]) /\
                                          angles[i,1] in known_angles[i-1] /\
                                          not (circles[i,1] in known_circles[i-1]) /\
                                          is_locus(points[i,1], points[i,2], angles[i,1], circles[i,1]) /\
                                          known_points[i] = known_points[i-1] /\
                                          known_lines[i] = known_lines[i-1] /\
                                          known_circles[i] = known_circles[i-1] union { circles[i,1] } /\
                                          known_angles[i] = known_angles[i-1]
                                          )
);
   
%   CenterThreePoints: Point1 x Point2 x Point3 -> Point4
constraint forall(i in 1..n)
( 
   construct[i] = CenterThreePoints -> (points[i,1] in known_points[i-1] /\
                                                               points[i,2] in known_points[i-1] /\
                                                               points[i,3] in known_points[i-1] /\
                                                               not (points[i,2] in coincident_points[points[i,1]]) /\
                                                               not (points[i,3] in coincident_points[points[i,1]]) /\
                                                               not (points[i,3] in coincident_points[points[i,2]]) /\ 
                                                               occurs(circle_center[circles[i,1]]) /\
                                                               not (deopt(circle_center[circles[i,1]]) in known_points[i-1]) /\
                                                               circles[i,1] in inc_circles[points[i,1]] /\
                                                               circles[i,1] in inc_circles[points[i,2]] /\
                                                               circles[i,1] in inc_circles[points[i,3]] /\
                                                               known_points[i] = known_points[i-1] union { deopt(circle_center[circles[i,1]]) } /\
                                                               known_lines[i] = known_lines[i-1] /\
                                                               known_circles[i] = known_circles[i-1] /\
                                                               known_angles[i] = known_angles[i-1]
                                                              )
);

%  CenterTwoPointsAndLine: Point1 x Point2 x Line1 -> Point3
constraint forall(i in 1..n)
( 
   construct[i] = CenterTwoPointsAndLine -> (points[i,1] in known_points[i-1] /\
                                                                          points[i,2] in known_points[i-1] /\
                                                                          not (points[i,2] in coincident_points[points[i,1]]) /\
                                                                          lines[i,1] in known_lines[i-1] /\
                                                                          occurs(circle_center[circles[i,1]]) /\
                                                                          not (deopt(circle_center[circles[i,1]]) in known_points[i-1]) /\
                                                                          lines[i,1] in inc_lines[deopt(circle_center[circles[i,1]])] /\ 
                                                                          circles[i,1] in inc_circles[points[i,1]] /\
                                                                          circles[i,1] in inc_circles[points[i,2]] /\
                                                                          is_not_perp_bisector(points[i,1], points[i,2], lines[i,1]) /\
                                                                          known_points[i] = known_points[i-1] union { deopt(circle_center[circles[i,1]]) } /\
                                                                          known_lines[i] = known_lines[i-1] /\
                                                                          known_circles[i] = known_circles[i-1] /\
                                                                          known_angles[i] = known_angles[i-1]
                                                                         )
);


% All required points must be constructed at the end
constraint goal_points subset known_points[n];

% All required lines must be constructed at the end
constraint goal_lines subset known_lines[n];

% All required circles must be constructed at the end
constraint goal_circles subset known_circles[n];

% All required angles must be constructed at the end
constraint goal_angles subset known_angles[n];

% The goal is to minimize the number of steps

solve ::seq_search([int_search([n], input_order, indomain_max)] ++ [ int_search([construct[i] + 0] ++ 
                                                                                                                 [points[i,j] | j in 1..maxPoints] ++
                                                                                                                 [lines[i,j] | j in 1..maxLines] ++
                                                                                                                 [circles[i,j] | j in 1..maxCircles] ++
                                                                                                                 [angles[i,j] | j in 1..maxAngles], 
                                                                                                                 input_order, indomain_min)  | i in 1..maxSteps]) minimize n;

%solve ::int_search([construct[i] | i in 1..maxSteps], input_order, indomain_split) minimize n;
              
% Fancy output              
output ["Solved in \(n) steps;\n"] ++ ["\(i). " ++ if fix(construct[i]) = LineIntersect then "point intersect of lines \(lines[i,1]) and \(lines[i,2]) --> \(points[i,1])\n" 
                                                            elseif fix(construct[i]) = LineThrough then "line through points \(points[i,1]) and \(points[i,2]) --> \(lines[i,1])\n"
                                                            elseif fix(construct[i]) = PerpendicularLine then "line perpendicular to line \(lines[i,1]) through point \(points[i,1]) --> \(lines[i,2])\n" 
                                                            elseif fix(construct[i]) = KnownRatio3 then "point with known ratio (3 points): \(points[i,1]), \(points[i,2]) --> \(points[i,3])\n"
                                                            elseif fix(construct[i]) = KnownRatio4 then "point with known ratio (4 points): \(points[i,1]),\(points[i,2]), \(points[i,3]) --> \(points[i,4])\n"
                                                            elseif fix(construct[i]) = ParallelLine then "line parallel  to \(lines[i,1]) through point \(points[i,1]) --> \(lines[i,2])\n"
                                                            elseif fix(construct[i]) = CircleCenterPoint then "circle with center \(points[i,1]) through point \(points[i,2]) --> \(circles[i,1])\n"
                                                            elseif fix(construct[i]) = CircleCenterTangent then "circle with center \(points[i,1]) and tangent \(lines[i,1]) --> \(circles[i,1])\n"
                                                            elseif fix(construct[i]) = TangentCirclePoint then "tangent from point \(points[i,1]) to circle \(circles[i,1]), where other tangent \(lines[i,1]) is known --> \(lines[i,2])\n"
                                                            elseif fix(construct[i]) = TangentsCirclePoint then "both tangents from point  \(points[i,1]) to circle \(circles[i,1]) --> \(lines[i,1]), \(lines[i,2])\n"
                                                            elseif fix(construct[i]) = LineCircleIntersects then "both intersects of line \(lines[i,1]) and circle \(circles[i,1]) --> \(points[i,1]),\(points[i,2])\n"
                                                            elseif fix(construct[i]) = CircleOverSegment then "circle over diameter with endpoints \(points[i,1]) and \(points[i,2]) --> \(circles[i,1])\n"
                                                            elseif fix(construct[i]) = LineCircleIntersect then "intersect of line  \(lines[i,1]) and circle \(circles[i,1]) where other intersect \(points[i,1]) is known --> \(points[i,2])\n"
                                                            elseif fix(construct[i]) = LineCircleIntersect2 then "intersect of line  \(lines[i,1]) and circle \(circles[i,1]) (only one intersect constructed) --> \(points[i,1])\n"
                                                            elseif fix(construct[i]) = CircleIntersects then "intersects of circles \(circles[i,1]) and \(circles[i,2]) --> \(points[i,1]), \(points[i,2])\n"
                                                            elseif fix(construct[i]) = CircleIntersect then "intersect of circles: \(circles[i,1]) and \(circles[i,2]) where other intersect \(points[i,1]) is known --> \(points[i,2])\n"
                                                            elseif fix(construct[i]) = AngleObtained then "angle obtained from lines \(lines[i,1]) and \(lines[i,2]), intersecting in \(points[i,1]) --> \(angles[i,1])\n"
                                                            elseif fix(construct[i]) = LineFromAngle then "line from computable angle with line \(lines[i,1]) through point \(points[i,1]) --> \(lines[i,2])\n"
                                                            elseif fix(construct[i]) = CenterThreePoints then "circle center from three points \(points[i,1]), \(points[i,2]) and \(points[i,3]) on circle --> \(deopt(circle_center[circles[i,1]]))\n"
                                                            elseif fix(construct[i]) = CenterTwoPointsAndLine then "circle center from two points  \(points[i,1]) and \(points[i,2]) on circle and a line \(lines[i,1]) through center --> \(deopt(circle_center[circles[i,1]]))\n"
                                                            elseif fix(construct[i]) = PerpendicularBisector then "line that is perpendicular bisector of a segment with endpoints \(points[i,1]) and \(points[i,2]) --> \(lines[i,1])\n"
                                                            elseif fix(construct[i]) = HarmonicQuadruple then "point harmonic with points \(points[i,1]), \(points[i,2]) and \(points[i,3]) --> \(points[i,4])\n"
                                                            elseif fix(construct[i]) = Homothety then "line obtained by homothety with center in \(points[i,1]) from line \(lines[i,1]) --> \(lines[i,2])\n" 
                                                            elseif fix(construct[i]) = Locus then "locus over segment with endpoints \(points[i,1]) and \(points[i,2]) seen at angle f(\(angles[i,1])) --> \(circles[i,1])\n"
                                                            else "unknown step\n" endif  | i in 1..fix(n)];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
