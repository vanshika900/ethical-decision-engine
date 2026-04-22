% =========================
% Evaluator Engine
% =========================

% Public API
evaluate(Framework, Action, Decision, Reason) :-
    dispatch(Framework, Action, Decision, Reason).


% =========================
% Dispatcher
% =========================

dispatch(judge, Action, Decision, Reason) :-
    judge_decision(Action, Decision, Reason).

dispatch(citizen, Action, Decision, Reason) :-
    citizen_decision(Action, Decision, Reason).

dispatch(utilitarian, Action, Decision, Reason) :-
    utilitarian_decision(Action, Decision, Reason).


% =========================
% Fallback (Unknown Framework)
% =========================

dispatch(Framework, _, unknown, 'Unknown framework') :-
    \+ known_framework(Framework).


% =========================
% Registry (IMPORTANT)
% =========================

known_framework(judge).
known_framework(citizen).
known_framework(utilitarian).