:- use_module(library(lists)).

% =========================
% Main decision rule
% =========================

utilitarian_decision(Action, Decision, Reason) :-
    utility(Action, Score),
    Score > 0,
    Decision = allow,
    Reason = 'Maximizes overall happiness'.

utilitarian_decision(Action, Decision, Reason) :-
    utility(Action, Score),
    Score < 0,
    Decision = deny,
    Reason = 'Causes more harm than good'.

utilitarian_decision(_, neutral, 'No net impact on overall happiness').


% =========================
% Utility Calculation (Improved)
% =========================

utility(Action, Score) :-
    findall(Value,
        (causes(Action, Effect), effect_value(Effect, Value)),
        Values),
    sum_list(Values, Score).