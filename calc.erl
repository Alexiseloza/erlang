%%% @author Alexis Loza <Author_Email>
%%% @copyright (C) 2025, Alexis Loza
%%% @doc 
%%%
%%% @end
%%% Created : 25 Aug 2025 by Alexis Loza <Author_Email>
-module(calc).
-export([calculator/0]).

calculator() ->
    io:format("Select operation: +, -, *, / or 'q' to quit~n"),
    Choice = string:trim(io:get_line("->")),
    case Choice of
        "q" ->
            io:format("Exiting calculator. Bye!~n");
        _ ->
          math_operation(Choice)
    end.

math_operation(Op) -> 
    io:format("Enter first number: ~n"),
    Num1String = string:trim(io:get_line("->")),
    Num1 =list_to_integer(Num1String),
    io:format("Enter second number: ~n"),
    Num2String = string:trim(io:get_line("->")),
    Num2 =list_to_integer(Num2String),

    case Op of
        "+" ->
            Result = Num1 + Num2,
            io:format("Result: ~p + ~p = ~p~n", [Num1, Num2, Result]),
            calculator();
        "-" ->
            Result = Num1 - Num2,
            io:format("Result: ~p - ~p = ~p~n", [Num1, Num2, Result]),
            calculator();
        "*" ->
            Result = Num1 * Num2,
            io:format("Result: ~p * ~p = ~p~n", [Num1, Num2, Result]),
            calculator();
        "/" ->
            case Num2 of
                0 ->
                    io:format("Error: Division by zero is not allowed.~n"),
                    calculator();
                _ ->
                    Result = Num1 / Num2,
                    io:format("Result: ~p / ~p = ~p~n", [Num1, Num2, Result]),
                    calculator()
            end
    end.