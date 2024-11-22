(define
   (domain constructions)
   (:requirements :adl)
   (:types
       point line circle angle - object
   )

   (:predicates
      (constructed ?o - object)
      (incident_point_line ?p - point ?l - line)
      (perp_lines ?l1 - line ?l2 - line)
      (incident_point_circle ?p - point ?c - circle)
      (circle_center ?p - point ?c - circle)
      (circle_diameter ?p1 - point ?p2 - point ?c - circle)
      (tangent_line ?c - circle ?l - line)
      (parallel_lines ?l1 - line ?l2 - line)
      (known_ratio_triplets ?p1 - point ?p2 - point ?p3 - point)
      (known_ratio_quadruples ?p1 - point ?p2 - point ?p3 - point ?p4 - point)  
      (angle_def ?l1 - line ?l2 - line ?an - angle)
      (perp_bisector ?p1 - point ?p2 - point ?l - line)
      (harmonic_quadruples ?p1 - point ?p2 - point ?p3 - point ?p4 - point)
      (homothety_triples ?p - point ?l1 - line ?l2 - line)
      (locus_def ?p - point ?q - point ?an - angle ?k - circle)
      
   )  

  (:action angle_obtained
       :parameters (?l1 - line ?l2 - line ?p - point ?an - angle)
       :precondition
          (and
	    (constructed ?l1)
	    (constructed ?l2)
	    (constructed ?p)
	    (incident_point_line ?p ?l1)
	    (incident_point_line ?p ?l2)
	    (angle_def ?l1 ?l2 ?an)
	    (not (constructed ?an))
	   )
	:effect
	   (constructed ?an)
  )

  (:action known_ratio3
      :parameters (?p - point ?q - point ?r - point)
      :precondition
         (and
	   (constructed ?p)
	   (constructed ?q)
	   (or (known_ratio_triplets ?p ?q ?r)
	       (known_ratio_triplets ?r ?p ?q)
	       (known_ratio_triplets ?p ?r ?q)
	   )
	   (not (constructed ?r))
	 )
      :effect
         (constructed ?r)
  )

  (:action known_ratio4
      :parameters (?p - point ?q - point ?r - point ?s - point)
      :precondition
         (and
	   (constructed ?p)
	   (constructed ?q)
	   (constructed ?r)
	   (not (constructed ?s))
	   (or (known_ratio_quadruples ?p ?q ?r ?s)
	       (known_ratio_quadruples ?p ?q ?s ?r)
	       (known_ratio_quadruples ?p ?s ?q ?r)
	       (known_ratio_quadruples ?s ?p ?q ?r)
	   )
	 )
      :effect
        (constructed ?s)
  )

  (:action line_through
       :parameters (?p - point ?q - point ?l - line)
       :precondition
          (and
	     (constructed ?p)
	     (constructed ?q)
	     (not (constructed ?l))
	     (incident_point_line ?p ?l)
	     (incident_point_line ?q ?l)
	     (not (= ?p ?q))
	  )
	:effect	   
	  (constructed ?l)
  )
  
  (:action line_intersection
       :parameters (?l1 - line ?l2 - line ?p - point)
       :precondition
          (and
	     (constructed ?l1)
	     (constructed ?l2)
	     (not (= ?l1 ?l2))
	     (not (parallel_lines ?l1 ?l2))
	     (incident_point_line ?p ?l1)
	     (incident_point_line ?p ?l2)
	     (not (constructed ?p))
	  )
        :effect
	  (constructed ?p)
  )

  (:action line_circle_intersections
      :parameters (?l - line ?c - circle ?p - point ?q - point)
      :precondition
         (and
            (constructed ?l)
	    (constructed ?c)
	    (not (constructed ?p))
	    (not (constructed ?q))
	    (incident_point_line ?p ?l)
	    (incident_point_line ?q ?l)
	    (incident_point_circle ?p ?c)
	    (incident_point_circle ?q ?c)
	    (not (= ?p ?q))	    
         )
      :effect
        (and
         (constructed ?p)
	 (constructed ?q)
	)
  )

  (:action line_circle_intersection
      :parameters (?l - line ?c - circle ?p - point ?q - point)
      :precondition
         (and
            (constructed ?l)
	    (constructed ?c)
	    (constructed ?p)
	    (not (constructed ?q))
	    (incident_point_line ?p ?l)
	    (incident_point_line ?q ?l)
	    (incident_point_circle ?p ?c)
	    (incident_point_circle ?q ?c)
	    (not (= ?p ?q))	    
         )
      :effect
	(constructed ?q)

  )


  (:action line_circle_intersection2
      :parameters (?l - line ?c - circle ?q - point)
      :precondition
         (and
            (constructed ?l)
	    (constructed ?c)
	    (not (constructed ?q))
	    (incident_point_line ?q ?l)
	    (incident_point_circle ?q ?c)
         )
      :effect
	(constructed ?q)
  )


  (:action circle_center_point
     :parameters (?p - point ?q - point ?c - circle)
     :precondition
         (and
	    (constructed ?p)
	    (constructed ?q)
	    (circle_center ?p ?c)
	    (incident_point_circle ?q ?c)
	    (not (constructed ?c))
	 )
     :effect
        (constructed ?c)
  )

  (:action circle_intersects
     :parameters (?c1 - circle ?c2 - circle ?p - point ?q - point)
     :precondition
        (and
	   (constructed ?c1)
	   (constructed ?c2)
	   (not (= ?c1 ?c2))
	   (incident_point_circle ?p ?c1)
	   (incident_point_circle ?p ?c2)
	   (incident_point_circle ?q ?c1)
	   (incident_point_circle ?q ?c2)
	   (not (= ?p ?q))
	   (not (constructed ?p))
	   (not (constructed ?q))
	)
     :effect
        (and
	   (constructed ?p)
	   (constructed ?q)
	)
   )

  (:action circle_intersect
     :parameters (?c1 - circle ?c2 - circle ?p - point ?q - point)
     :precondition
        (and
	   (constructed ?c1)
	   (constructed ?c2)
	   (not (= ?c1 ?c2))
	   (incident_point_circle ?p ?c1)
	   (incident_point_circle ?p ?c2)
	   (incident_point_circle ?q ?c1)
	   (incident_point_circle ?q ?c2)
	   (not (= ?p ?q))
	   (constructed ?p)
	   (not (constructed ?q))
	)
     :effect
	(constructed ?q)
   )

  (:action circle_over_segment
    :parameters (?p - point ?q - point ?c - circle)
    :precondition
       (and
          (constructed ?p)
	  (constructed ?q)
	  (not (= ?p ?q))
	  (incident_point_circle ?p ?c)
	  (incident_point_circle ?q ?c)
          (circle_diameter ?p ?q ?c)
	  (not (constructed ?c))
        )
    :effect
       (constructed ?c)
   )

  (:action perpendicular_line
     :parameters (?l1 - line ?p - point ?l2 - line)
     :precondition
        (and
	   (constructed ?l1)
	   (constructed ?p)
	   (incident_point_line ?p ?l2)
	   (perp_lines ?l1 ?l2)
	   (not (constructed ?l2))
	)
     :effect
       (constructed ?l2)
   )

  (:action circle_center_tangent
     :parameters (?p - point ?l - line ?c - circle)
     :precondition
        (and
	  (constructed ?p)
	  (constructed ?l)
	  (not (incident_point_line ?p ?l))
	  (tangent_line ?c ?l)
	  (circle_center ?p ?c)
	  (not (constructed ?c))
	)
     :effect
       (constructed ?c)
   )

  (:action tangents_circle_point
      :parameters (?c - circle ?p - point ?l1 - line ?l2 - line)
      :precondition
         (and
	    (constructed ?c)
	    (constructed ?p)
	    (not (= ?l1 ?l2))
	    (incident_point_line ?p ?l1)
	    (incident_point_line ?p ?l2)
	    (tangent_line ?c ?l1)
	    (tangent_line ?c ?l2)
	    (not (constructed ?l1))
	    (not (constructed ?l2))
	 )
      :effect
         (and
	   (constructed ?l1)
	   (constructed ?l2)
	 )
   )

  (:action tangent_circle_point
      :parameters (?c - circle ?p - point ?l1 - line ?l2 - line)
      :precondition
         (and
	    (constructed ?c)
	    (constructed ?p)
	    (not (= ?l1 ?l2))
	    (incident_point_line ?p ?l1)
	    (incident_point_line ?p ?l2)
	    (tangent_line ?c ?l1)
	    (tangent_line ?c ?l2)
	    (constructed ?l1)
	    (not (constructed ?l2))
	 )
      :effect         
        (constructed ?l2)	 
   )

   (:action perpendicular_bisector
      :parameters (?p - point ?q - point ?l - line)
      :precondition
         (and
	    (constructed ?p)
	    (constructed ?q)
	    (not (= ?p ?q))
            (perp_bisector ?p ?q ?l)
	    (not (constructed ?l))
	 )
     :effect
        (constructed ?l)
   )

   (:action homothety
       :parameters (?p - point ?l1 - line ?l2 - line) 
       :precondition
         (and
	   (constructed ?p)
	   (constructed ?l1)
	   (not (constructed ?l2))
	   (or (homothety_triples ?p ?l1 ?l2)
	       (homothety_triples ?p ?l2 ?l1)
	   )
	 )
       :effect
         (constructed ?l2)
   )

   (:action parallel_line
       :parameters (?l1 - line ?p - point ?l2 - line)
       :precondition
           (and
	      (constructed ?l1)
	      (constructed ?p)
	      (incident_point_line ?p ?l2)
	      (parallel_lines ?l1 ?l2)
	      (not (constructed ?l2))
	   )
        :effect
	   (constructed ?l2)
   )

   (:action line_from_angle
       :parameters (?l1 - line ?p - point ?an - angle ?l2 - line)
       :precondition
          (and
	     (constructed ?l1)
	     (constructed ?p)
	     (constructed ?an)
	     (incident_point_line ?p ?l1)
	     (incident_point_line ?p ?l2)
	     (or (angle_def ?l1 ?l2 ?an) (angle_def ?l2 ?l1 ?an))	     
	     (not (constructed ?l2))
	 )
       :effect
         (constructed ?l2)
   )

  (:action harmonic_quadruple
      :parameters (?p - point ?q - point ?r - point ?s - point)
      :precondition
         (and
	   (constructed ?p)
	   (constructed ?q)
	   (constructed ?r)
	   (not (constructed ?s))
	   (not (= ?p ?q))
	   (not (= ?q ?r))
	   (not (= ?p ?r))
	   (or (harmonic_quadruples ?p ?q ?r ?s)
	       (harmonic_quadruples ?p ?q ?s ?r)
	       (harmonic_quadruples ?p ?s ?q ?r)
	       (harmonic_quadruples ?s ?p ?q ?r)
	   )    
         )
      :effect
        (constructed ?s)
  )

 (:action locus
     :parameters (?p - point ?q - point ?an - angle ?c - circle)
     :precondition
        (and
	  (constructed ?p)
	  (constructed ?q)
	  (not (= ?p ?q))
	  (constructed ?an)
	  (not (constructed ?c))
	  (locus_def ?p ?q ?an ?c)
	)
     :effect
        (constructed ?c)
   )

  (:action center_three_points
     :parameters (?p - point ?q - point ?r - point ?c - circle ?s - point)
     :precondition
         (and
	    (constructed ?p)
	    (constructed ?q)
	    (constructed ?r)
  	    (not (constructed ?s))
	    (not (= ?p ?q))
	    (not (= ?q ?r))
	    (not (= ?p ?r))
	    (circle_center ?s ?c)
	    (incident_point_circle ?p ?c)
	    (incident_point_circle ?q ?c)
	    (incident_point_circle ?r ?c)
	  )
      :effect
         (constructed ?s)
   )

  (:action center_two_points_and_line
      :parameters (?p - point ?q - point ?l - line ?c - circle ?r - point)
      :precondition
         (and
	    (constructed ?p)
	    (constructed ?q)
	    (not (= ?p ?q))
	    (constructed ?l)
	    (not (constructed ?r))
	    (circle_center ?r ?c)
	    (incident_point_line ?r ?l)
	    (incident_point_circle ?p ?c)
	    (incident_point_circle ?q ?c)
	    (not (perp_bisector ?p ?q ?l))
	    (not (perp_bisector ?q ?p ?l))
	  )
      :effect
         (constructed ?r)
   )
)
