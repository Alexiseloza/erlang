-module(ship).
-export([start/0,ship/1]).
-author("Alexis Loza").
%%% @author Alexis Loza <Author_Email>
%%% 
%%% 
start()->
    NewShip = start_ship(),
    loop(NewShip).


start_ship()->
    spawn(?MODULE, ship, [10]).


loop(Pid)->
    io:format("1. Fire a Missile~n2. Quit~n"),
    Choice = string:trim(io:get_line("->")),
    case Choice of
        "1" ->
            Pid ! {single, 1, self()},
            receive
                {new_count, NewAmmo}->
                    io:format("Missiles Count: ~p", [NewAmmo]),
                end,
            loop(Pid);
        "2" ->
            io:format("Bye...~n")
    end.

ship(CurrentAmmo)->
    receive
        {single, Amount, From} ->
            NewAmmo = max(CurrentAmmo - Amount, 0),
            From ! {new_count, NewAmmo},
            ship(NewAmmo)
    end.      