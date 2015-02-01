-module(leap).
-export([leap_year/1]).

%% @doc Determine whether a given year is a leap year.
-spec leap_year(integer()) -> boolean().
leap_year(Y) when is_integer(Y) ->
	  case Y rem 4 of
		    0 -> Y rem 100 =/= 0 orelse Y rem 400 =:= 0;
		    _ -> false
	  end.

