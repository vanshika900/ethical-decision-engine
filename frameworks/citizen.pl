% =========================
% Citizen Framework
% =========================

% Main decision rule
citizen_decision(Action, Decision, Reason) :-
    morally_justified(Action),
    Decision = allow,
    Reason = 'Morally justified due to necessity'.

citizen_decision(Action, Decision, Reason) :-
    morally_wrong(Action),
    Decision = deny,
    Reason = 'Morally wrong action'.

citizen_decision(Action, Decision, Reason) :-
    Decision = neutral,
    Reason = 'No strong moral opinion'.


% =========================
% Moral Reasoning Rules
% =========================

% Helping someone survive is morally good
morally_justified(Action) :-
    causes(Action, saves_life).

% Default: illegal acts are wrong UNLESS justified
morally_wrong(Action) :-
    illegal(Action),
    \+ morally_justified(Action).