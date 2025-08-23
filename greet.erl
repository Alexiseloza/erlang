%%% @author Alexis Loza <Author_Email>
%%% @copyright (C) 2025, Alexis Loza
%%% @doc 
%%%
%%% @end
%%% Created : 21 Aug 2025 by Alexis Loza <Author_Email>
-module(greet).
-export([hello/0, start/0]).

hello()->
    io:format("Hello , wolrd!~n").
start()->
    hello(),
    get_name(),
    get_age().

get_name()->
    io:format("Enter your name ~n"),
    FisrtName = string:trim(io:get_line("->")),
    io:format("Nice to Meet you ~s~n",[FisrtName]).

get_age()->
    io:format("Enter your Age ~n"),
    AgeString = string:trim(io:get_line("->")),
    Age = list_to_integer(AgeString),
    PlusFive = Age + 5,
    io:format("You are ~p year old ~n in five years you will be  ~p~n", [Age, PlusFive]).

