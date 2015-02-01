-module(leap).
-export([leap_year/1]).

leap_year(Year) ->
	(Year rem 4 == 0) and (not(Year rem 100 == 0) or (Year rem 400 == 0)).
