% =========================
% Extended Facts & Knowledge Base
% =========================

% -------- Situations --------
situation(hungry_child).
situation(poor_family).
situation(dangerous_attack).
situation(exam_pressure).
situation(job_interview).
situation_war.

% -------- Actions --------
action(steal_food).
action(lie_to_protect).
action(harm_in_self_defense).
action(cheat_in_exam).
action(bribe_official).
action(tell_truth_harshly).
action(save_multiple_people).
action(sacrifice_one_to_save_many).

% -------- Legality --------
illegal(steal_food).
illegal(lie_to_protect).
illegal(cheat_in_exam).
illegal(bribe_official).
illegal(sacrifice_one_to_save_many).

% -------- Consequences --------
causes(steal_food, saves_life).
causes(steal_food, harms_shopkeeper).

causes(lie_to_protect, saves_life).
causes(lie_to_protect, breaks_trust).

causes(harm_in_self_defense, prevents_harm).

causes(cheat_in_exam, unfair_advantage).
causes(cheat_in_exam, harms_others).

causes(bribe_official, speeds_process).
causes(bribe_official, corrupts_system).

causes(tell_truth_harshly, emotional_harm).
causes(tell_truth_harshly, honesty_upheld).

causes(save_multiple_people, saves_many_lives).

causes(sacrifice_one_to_save_many, saves_many_lives).
causes(sacrifice_one_to_save_many, kills_innocent).

% -------- Utility Weights --------
effect_value(saves_life, 10).
effect_value(saves_many_lives, 20).
effect_value(prevents_harm, 6).
effect_value(honesty_upheld, 4).
effect_value(speeds_process, 2).

effect_value(harms_shopkeeper, -4).
effect_value(breaks_trust, -3).
effect_value(unfair_advantage, -5).
effect_value(harms_others, -6).
effect_value(corrupts_system, -8).
effect_value(emotional_harm, -2).
effect_value(kills_innocent, -20).