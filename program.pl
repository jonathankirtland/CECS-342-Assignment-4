main :- (
% "Star Tricked Solution Template.pl"
%
% CECS 342 Assignment 4
% Logic Puzzle
% Solution Template: >>> Please fill in the missing code! <<<
%
% Each person reported a "UFO" sighting on a different day of the week.
%
% How to run this:
% ?- solve.

% Chronoligical order of weekdays
earlier(A, B) :-
  append(Earlier, Later, ['Tuesday', 'Wednesday', 'Thursday', 'Friday']),
  member(A, Earlier), member(B, Later), !.
  
% Solve the puzzle.
solve :-
  % Each event is represented by a triple of the form
  % (Person, Object, Day) in a list of events:
  Events = [
    ('Ms. Gort',   _, _        ),
    ('Mr. Klaatu', _, KlaatuDay),
    ('Ms. Barada', _, _        ),
    ('Mr. Nikto',  _, _        )
  ],

  member((_, balloon,     BallonDay ), Events),
  member((_, clothesline, _         ), Events),
  member((_, frisbee,     FrisbeeDay), Events),
  member((_, watertower,  _         ), Events),

  member((_, _, 'Tuesday'),   Events),
  member((_, _, 'Wednesday'), Events),
  member((_, _, 'Thursday'),  Events),
  member((_, _, 'Friday'),    Events),

  % 1. Mr. 'Mr. Klatu' made his sighting at some point earlier in the week
  %    than the one who saw the ballon, but at some point later in the week
  %    than the one who spotted the Frisbee (who isn't Ms. 'Ms. Gort').
  
  earlier(FrisbeeDay, KlaatuDay),
  earlier(KlaatuDay, BalloonDay),
  \+ member(('Ms. Gort', frisbee, _), Events),

      
  % 2. Friday's sighting was made by either Ms. 'Ms. Barrada'
  %    or the one who saw the clothesline or both.
  
  (member(('Ms. Barada', _, 'Friday'), Events); member((_, clothesline, 'Friday'), Events)),
      
      
  % 3. Mr. 'Mr. Nikto' did not make his sighting on 'Tuesday'.
  
  \+ member(('Mr. Nikto', _, 'Tuesday'), Events),
      
      
  % 4. Mr. 'Mr. Klatu' isn't the one whose object turned out to be a water tower.
  
  \+ member(('Mr. Klaatu', watertower, _), Events),      
      
  % Display a solution: An English sentence for each event.
  foreach(member(T, Events), report(T)).

% Write out an English sentence for an event.
report((Who, What, When)) :-
  write(Who), write(' saw the '), write(What),
  write(' on '), write(When), write('.'), nl.
).