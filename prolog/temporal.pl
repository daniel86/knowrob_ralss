
%%%
% Expose some rules for querying.
:- module(temporal,
    [
      temporal_extend_begin/2,
      temporal_extend_end/2,
      temporal_extend/2,
      before/2,
      after/2,
      during/2,
      starts/2
    ]).

%%%
% use_module loads rules exposed by modules and makes them available
% within this module.
:- use_module(library('semweb/rdf_db')).  % RDF triple store
:- use_module(library('semweb/rdfs')).    % RDFS semantics ontop of RDF
:- use_module(library('owl')).            % OWL semantics ontop of RDFS

%%%
% rdf_meta is primary used for namespace expansion.
% Arguments annotated with 'r' are expected to be resource IRIs
% where namespace prefixes should be replaced before actually calling
% the predicate.
% This allows, for example, to call `before(knowrob:'Foo_0',knowrob:'Bar_0')`
% instead of writinh the full IRI.
:- rdf_meta temporal_extend_begin(r,?),
            temporal_extend_end(r,?),
            temporal_extend(r,?),
            before(r,r),
            after(r,r),
            during(r,r),
            starts(r,r).

%%%
% Register some namespace prefixes (see above)
:- rdf_db:rdf_register_ns(owl, 'http://www.w3.org/2002/07/owl#', [keep(true)]).
:- rdf_db:rdf_register_ns(rdfs, 'http://www.w3.org/2000/01/rdf-schema#', [keep(true)]).
:- rdf_db:rdf_register_ns(rdf, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#', [keep(true)]).
:- rdf_db:rdf_register_ns(knowrob_ralss, 'http://www.knowrob.org/knowrob_ralss.owl#', [keep(true)]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Temporally extended things
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
% Unifies a temporally extended thing with the time instant
% the thing started to exists.
% Should fail in case Subject does not have a temporal extend.
% Begin should be a number (not an atom), so that
% arithmetic operations can be performed.
temporal_extend_begin(Subject,Begin) :- fail.

%%%
% Unifies a temporally extended thing with the time instant
% the thing ended to exists.
% Should fail in case Subject does not have a temporal extend,
% and should fail in case the object still exists (i.e., we don't know yet
% when it will stop existing).
% End should be a number (not an atom), so that
% arithmetic operations can be performed.
temporal_extend_end(Subject,End) :- fail.

%%%
% Unifies a temporally extended thing with the time interval
% during which the thing exists.
% Should fail in case Subject does not have a temporal extend.
% Interval should be a list of two numbers [Begin,End] in case
% we know when the thing stopped existing, and a list of one number [Begin]
% in case we don't know yet when the thing stopps existing.
temporal_extend(Subject,[Begin,End]) :- fail.
temporal_extend(Subject,[Begin]) :- fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Interval algebra
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
% Unifies Evt1 and Evt2 in case Evt1 occurs before Evt2.
% Thus Evt1 ended before Evt2 started.
before(Evt1,Evt2) :- fail.

%%%
% Unifies Evt1 and Evt2 in case Evt2 occurs before Evt1.
% Thus Evt2 ended before Evt1 started.
after(Evt1,Evt2) :- fail.

%%%
% Unifies Evt1 and Evt2 in case Evt1 occurs during Evt2.
% Thus Evt2 started before or together with Evt1 and ended earlier or
% to the same time.
during(Evt1,Evt2) :- fail.

%%%
% Unifies Evt1 and Evt2 in case Evt1 starts Evt2.
% Thus Evt1 and Evt2 start at the same time but Evt1 ends earlier or to the same time.
starts(Evt1,Evt2) :- fail.

