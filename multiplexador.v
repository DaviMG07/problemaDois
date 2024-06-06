module multiplexador(
    input inA,
    input inB,
    input chaveSeletora,
    output outX
);

wire [1:0] aux;

and(aux[0], !chaveSeletora, inA);
and(aux[1], chaveSeletora, inB);
or(outX, aux[0], aux[1]);

endmodule
