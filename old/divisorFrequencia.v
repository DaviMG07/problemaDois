module divisorFrequencia(
    input clock,
    output displayClock,
    output clockOut
);

wire [30:0] aux;

divisorCinco(clock, aux[0]);
divisorCinco(aux[0], aux[1]);
divisorCinco(aux[1], aux[2]);
divisorCinco(aux[2], aux[3]);
divisorCinco(aux[3], aux[4]);
divisorCinco(aux[4], aux[5]);
divisorCinco(aux[5], aux[6]);
divisorCinco(aux[6], aux[7]);
flipFlopT(!aux[7], 1, 0, aux[8]);
flipFlopT(!aux[8], 1, 0, aux[9]);
flipFlopT(!aux[9], 1, 0, aux[10]);
flipFlopT(!aux[10], 1, 0, aux[11]);
flipFlopT(!aux[11], 1, 0, aux[12]);
flipFlopT(!aux[12], 1, 0, aux[13]);
flipFlopT(aux[13], 1, 0, clockOut);
assign displayClock = aux[6];

endmodule

module divisorCinco(
    input clockIn,
    output clockOut
);

wire [3:0] aux;

contadorCinco(clockIn, aux, clockOut);

endmodule
