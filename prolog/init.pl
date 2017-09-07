
%%%
% Ensure that knowrob_common is loaded.
% This calls internally init.pl in the knowrob_common package
% so that rules and facts exposed by knowrob_common or depending packages
% are available in the interactive console for querying the KB.
% This includes OWL rules such as owl_individual_of and owl_has
% that add OWL semantics ontop of the RDF triple store used in KnowRob.
:- register_ros_package(knowrob_common).

%%%
% OWL ontologies can be represented in different formats such
% as Turtle or RDF/XML.
% owl_parse maps RDF/XML encoded ontology elements to Prolog facts to
% make them available for querying.
%
% Elements of ontologies are:
%     - Class descriptions: Name and set of properties that describe specific entities
%     - Individuals:        Elements of sets given by some class description
%     - Properties:         General facts about elements of a class
%
% Class descirptions go beyond simple taxonomy.
% They can, for example, be declared as enumaration of instances,
% union or intersection of other classes, or
% as complement of or disjoint to some other class.
% They can also include restrictions on the range of some properties:
%     - hasValue:       Every instance of the class must have this value for specified property
%     - allValuesFrom:  Any value of a property (if any) must be an instance of the specified type
%     - someValuesFrom: There must be at least one value of the property instance of the specified type
%
% Properties are described by their domain and range, they describe all subclasses
% of the property domain and accept only instances of subclasses of the range.
% Properties can furthermore be declared as reflexive, inverse, functional, ...
% 
% OWL(DL) can be translated to description logics which is a usefull because:
%     - DL Reasoning is domain independent
%     - DL Reasoning is application independent
%     - DL Reasoning is optimized
%     - DL Reasoning is well understood (complexity)
%
:- owl_parser:owl_parse('package://knowrob_ralss/owl/knowrob_ralss.owl').

%%%
% Entities in OWL ontologies are identified by IRIs.
% It is cumbersome to allways write the full IRI when querying.
% The Prolog RDF library allows, for this reason, to introduce compact notations
% for IRI prefixes (RDF namespaces) which are internally replaced by the
% full IRI.
:- rdf_db:rdf_register_ns(knowrob_ralss, 'http://knowrob.org/kb/knowrob_ralss.owl#', [keep(true)]).

%%%
% use_module must be called for any Prolog source file that should
% be exposed for querying.
:- use_module(library('prolog-basics')).  % load prolog-basics.pl
:- use_module(library('temporal')).       % load temporal.pl

