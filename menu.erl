-module(menu).
-export([menu/0]).
-author("Alexis Loza").

menu()->
    io:format("Select your option of menu~n"),
    Choise = string:trim(io:get_line("->")),
    case Choise of
        "Burger" ->
            io:format("Yummy Burgers~n"),
            menu();
        "Tacos" ->
            io:format("Yummy Tacos~n"),
            menu();
        "Pizza" ->
            io:format("Yummy ~s ~n", [Choise]),
            menu();
        _ ->
            io:format("Sorry... we don't have that. ~n")
        end.

% Erlang code 
