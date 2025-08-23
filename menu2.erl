-module(menu2).
-export([full_menu/0, orders/0]).

full_menu() ->
    ["pizza", "burger", "soup", "tacos", "hot dog"].  % Cambiar a minúsculas para la comparación

orders() ->
    io:format("Enter your choice or 'Exit' to quit ~n"),
    Choice = string:trim(io:get_line("->")),
    LowerChoice = string:lowercase(Choice),
    case LowerChoice of 
        "exit" ->
            io:format("Thanks for visiting ~n");
        _ ->
            
            case lists:member(LowerChoice, full_menu()) of
                true ->
                    io:format("Your choice is: ~s ~n", [LowerChoice]),
                    orders();  % Llama a orders nuevamente
                false ->
                    io:format("We don't have this menu today! ~n")
                     % si Ordes esta en esta linea, cierra la conexion luego del Exit, de otro modo, queda abierta!!!
            end,
            orders()  % Llama a orders nuevamente
    end.