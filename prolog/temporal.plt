

:- begin_tests(temporal).

:- use_module(library('semweb/rdf_db')).
:- use_module(library('semweb/rdfs')).
:- use_module(library('owl')).
:- use_module(library('owl_parser')).
:- use_module(library('temporal')).

%%%
% Register some namespace prefixes (see above)
:- rdf_db:rdf_register_ns(owl, 'http://www.w3.org/2002/07/owl#', [keep(true)]).
:- rdf_db:rdf_register_ns(rdfs, 'http://www.w3.org/2000/01/rdf-schema#', [keep(true)]).
:- rdf_db:rdf_register_ns(rdf, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#', [keep(true)]).
:- rdf_db:rdf_register_ns(knowrob_ralss, 'http://www.knowrob.org/knowrob_ralss.owl#', [keep(true)]).

test(summer_school_ongoing1, [nondet]) :-
  temporal_extend_begin(knowrob_ralss:'SummerSchool_RALSS', Begin),
  number(Begin),
  \+ temporal_extend_end(knowrob_ralss:'SummerSchool_RALSS', _).
test(summer_school_ongoing2, [nondet]) :-
  temporal_extend(knowrob_ralss:'SummerSchool_RALSS', [Begin]),
  number(Begin).

% Summer school is started by overview lecture
test(overview_starts_summer_schools, [nondet]) :-
  starts(knowrob_ralss:'OverviewLecture_RALSS', knowrob_ralss:'SummerSchool_RALSS').

% Designing control lectured happened before deep learning lecture
test(designing_control_before_deep_learning, [nondet]) :-
  before(knowrob_ralss:'DesigningControlExercise_RALSS', knowrob_ralss:'DeepLearningLecture_RALSS').

% Boat trip happened after deep learning lecture
test(boat_trip_after_deep_learning, [nondet]) :-
  after(knowrob_ralss:'BoatTrip_RALSS', knowrob_ralss:'DeepLearningLecture_RALSS').
test(deep_learning_after_designing_control, [nondet]) :-
  after(knowrob_ralss:'DeepLearningLecture_RALSS', knowrob_ralss:'DesigningControlExercise_RALSS').

% The lectures take place during the summer school
test(designing_control_during_summer_school, [nondet]) :-
  during(knowrob_ralss:'DesigningControlExercise_RALSS', knowrob_ralss:'SummerSchool_RALSS').
test(deep_learning_during_summer_school, [nondet]) :-
  during(knowrob_ralss:'DeepLearningLecture_RALSS', knowrob_ralss:'SummerSchool_RALSS').
test(overview_during_summer_school, [nondet]) :-
  during(knowrob_ralss:'OverviewLecture_RALSS', knowrob_ralss:'SummerSchool_RALSS').

:- end_tests(temporal).
