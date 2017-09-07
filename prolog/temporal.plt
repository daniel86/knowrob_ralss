

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

test(summer_school_ongoing1) :-
  temporal_extend_begin(knowrob_ralss:'SummerSchool_RALSS', _)
  \+ temporal_extend_end(knowrob_ralss:'SummerSchool_RALSS', _).
test(summer_school_ongoing2) :-
  temporal_extend(knowrob_ralss:'SummerSchool_RALSS', [_]).

% TODO: write more tests

:- end_tests(temporal).
