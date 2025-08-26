%%% @author Alexis Loza <Author_Email>
%%% @copyright (C) 2025, Alexis Loza
%%% @doc 
%%%
%%% @end
%%% Created : 25 Aug 2025 by Alexis Loza <Author_Email>
-module(calc).
-export([add/2, sub/2, mult/2, div/2]).

calculator() ->
    io:format("Select operation: +, -, *, / or 'q' to quit~n"),
    Operation = string:trim(io:get_line("->")),
    case Operation of
        "q" ->
            io:format("Exiting calculator. Goodbye!~n");
        _ ->
            Num1Str = string:trim(io:get_line("Enter first number: ")),
            Num2Str = string:trim(io:get_line("Enter second number: ")),
            {ok, Num1} = string:to_integer(Num1Str),
            {ok, Num2} = string:to_integer(Num2Str),
            Result = 
                case Operation of
                    "+" -> add(Num1, Num2);
                    "-" -> sub(Num1, Num2);
                    "*" -> mult(Num1, Num2);
                    "/" -> div(Num1, Num2);
                    _ -> 
                        io:format("Invalid operation!~n"),
                        calculator()
                end,
            io:format("Result: ~p ~n", [Result]),
            calculator()
    end.
