module contadorDez(
    input clock,
    output [3:0] vetor,
    output reset
);

flipFlopT(!clock, 1, reset, vetor[0]);
flipFlopT(!vetor[0], 1, reset, vetor[1]);
flipFlopT(!vetor[1], 1, reset, vetor[2]);
flipFlopT(!vetor[2], 1, reset, vetor[3]);
and(reset, vetor[3], vetor[1]);

endmodule

module contadorCinco(
    input clock,
    output [3:0] vetor,
    output reset
);

flipFlopT(!clock, 1, reset, vetor[0]);
flipFlopT(!vetor[0], 1, reset, vetor[1]);
flipFlopT(!vetor[1], 1, reset, vetor[2]);
and(reset, vetor[2], vetor[0]);

endmodule

module decrementadorDez(
    input clock,
    input [3:0] preset,
    input reset,
    output [3:0] vetor,
    output valorMaximo
);

wire [3:1] toggle;
wire [2:0] aux;

flipFlopT_1(clock, 1, preset[0], reset, vetor[0]);

or(aux[0], vetor[3], vetor[2], vetor[1]);
and(toggle[1], aux[0], !vetor[0]);
flipFlopT_1(clock, toggle[1], preset[1], reset, vetor[1]);

and(aux[1], vetor[2], !vetor[1]);
or(aux[2], vetor[3], aux[1]);
and(toggle[2], aux[2], !vetor[0]);
flipFlopT_1(clock, toggle[2], preset[2], reset, vetor[2]);

and(toggle[3], !vetor[2], !vetor[1], !vetor[0]);
flipFlopT_1(clock, toggle[3], preset[3], reset, vetor[3]);

and(valorMaximo, vetor[0], vetor[3]);

endmodule

module decrementadorSeis(
    input clock,
    input [3:0] preset,
    input reset,
    output [3:0] vetor,
    output valorMaximo
);

wire [3:2] toggle;
wire aux;

flipFlopTCompleto(clock, 1, preset[0], reset, vetor[0]);

or(aux, vetor[1], vetor[2]);
and(toggle[1], aux, !vetor[0]);
flipFlopTCompleto(clock, toggle[1], preset[1], reset, vetor[1]);

and(toggle[2], !vetor[1], !vetor[0]);
flipFlopTCompleto(clock, toggle[2], preset[2], reset, vetor[2]);

flipFlopTCompleto(clock, 0, preset[3], reset, vetor[3]);

and(valorMaximo, vetor[0], vetor[2]);

endmodule

module decrementadorTres(
    input clock,
    input [3:0] preset,
    input reset,
    output [3:0] vetor,
    output valorMaximo
);

flipFlopTCompleto(clock, 1, preset[0], reset, vetor[0]);

flipFlopTCompleto(clock, !vetor[0], preset[1], reset, vetor[1]);

flipFlopTCompleto(clock, toggle[2], preset[2], reset, vetor[2]);

flipFlopTCompleto(clock, 0, preset[3], reset, vetor[3]);

and(valorMaximo, vetor[0], vetor[1]);

endmodule
