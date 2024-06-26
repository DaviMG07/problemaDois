module main(
    input clock,
    input umidadeAr,
    input umidadeSolo,
    input temperatura,
    input [2:0] nivelDagua,
    output [3:0] displayDigits,
    output [7:0] displaySegments,
	 output umSegundo
);

wire [3:0] dezenaMinuto, unidadeMinuto, dezenaSegundos, unidadeSegundos;
wire displayClock;

divisorFrequencia(clock, displayClock, umSegundo);

//só cronometra 1 hora, de forma crescente, e sem levar em conta a irrigação e nível d'agua
cronometro(displayClock, umSegundo, dezenaMinuto, unidadeMinuto, dezenaSegundos, unidadeSegundos, displayDigits, displaySegments);

endmodule
