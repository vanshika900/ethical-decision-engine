% =========================
% Judge Framework
% =========================

% Main predicate
judge_decision(Action, Decision, Reason) :-
    illegal(Action),
    \+ exception_allowed(Action),   % no exception applies
    Decision = deny,
    Reason = 'Violates the law'.

judge_decision(Action, Decision, Reason) :-
    illegal(Action),
    exception_allowed(Action),      % exception applies
    Decision = allow,
    Reason = 'Exception: action necessary to save life'.

judge_decision(Action, Decision, Reason) :-
    \+ illegal(Action),
    Decision = allow,
    Reason = 'No law violated'.


% =========================
% Exceptions (Judicial discretion)
% =========================

% A judge may allow illegal acts in extreme necessity
exception_allowed(Action) :-
    causes(Action, saves_life).