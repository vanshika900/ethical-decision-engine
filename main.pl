% =========================
% Main Entry Point
% =========================

:- initialization(start, main).

% -------- Load Files --------
:- consult('knowledge/facts.pl').
:- consult('frameworks/judge.pl').
:- consult('frameworks/citizen.pl').
:- consult('frameworks/utilitarian.pl').
:- consult('engine/evaluator.pl').
:- consult('config/registry.pl').


% =========================
% Start Program
% =========================

start :-
    writeln('--- Ethical Decision Engine ---'),
    run_all.


% =========================
% Run All Combinations
% =========================

run_all :-
    forall(
        (framework(F), action(A)),
        (
            evaluate(F, A, Decision, Reason),
            format("~w (~w): ~w - ~w~n", [F, A, Decision, Reason])
        )
    ).


% =========================
% Test Single Action
% =========================

test(Action) :-
    writeln('--- Testing Single Action ---'),
    forall(
        framework(F),
        (
            evaluate(F, Action, D, R),
            format("~w: ~w - ~w~n", [F, D, R])
        )
    ).