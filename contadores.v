module contadorDez(
    input clock,
    output [4:0] vetor,
    output reset
);

flipFlopT(!clock, 1, reset, vetor[0]);
flipFlopT(!vetor[0], 1, reset, vetor[1]);
flipFlopT(!vetor[1], 1, reset, vetor[2]);
flipFlopT(!vetor[2], 1, reset, vetor[3]);
and(reset, vetor[3], vetor[1]);

endmodule

module contadorSeis(
    input clock,
    output [4:0] vetor,
    output reset
);

flipFlopT(!clock, 1, reset, vetor[0]);
flipFlopT(!vetor[0], 1, reset, vetor[1]);
flipFlopT(!vetor[1], 1, reset, vetor[2]);
and(reset, vetor[2], vetor[1]);

endmodule

module contadorCinco(
    input clock,
    output [4:0] vetor,
    output reset
);

flipFlopT(!clock, 1, reset, vetor[0]);
flipFlopT(!vetor[0], 1, reset, vetor[1]);
flipFlopT(!vetor[1], 1, reset, vetor[2]);
and(reset, vetor[2], vetor[0]);

endmodule

module decresceDez(
    input clock,
    output [4:0] vetor,
    output reset
);

wire [4:0] notaux;

flipFlopT_2(!clock, 1, reset, vetor[0], notaux[0]);
flipFlopT_2(!vetor[0], 1, reset, vetor[1], notaux[1]);
flipFlopT_2(!vetor[1], 1, reset, vetor[2], notaux[2]);
flipFlopT_2(!vetor[2], 1, reset, vetor[3], notaux[3]);
and(reset, vetor[3], vetor[1]);

endmodule