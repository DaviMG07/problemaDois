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

module quatroUm(
    input inA,
    input inB,
    input inC,
    input inD,
    input chave0,
    input chave1,
    output outX
);

wire [3:0] aux;

multiplexador(inA, inB, chave0, aux[0]);
multiplexador(inC, inD, chave0, aux[1]);
multiplexador(aux[0], aux[1], chave1, outX);

endmodule

module SeisPDois(
    input [2:0] inA,
    input [2:0] inB,
    input chave,
    output [2:0] outX
);

multiplexador(inA[0], inB[0], chave, outX[0]);
multiplexador(inA[1], inB[1], chave, outX[1]);
multiplexador(inA[2], inB[2], chave, outX[2]);

endmodule

module DezesseisPQuatro(
    input [3:0] inA,
    input [3:0] inB,
    input [3:0] inC,
    input [3:0] inD,
    input chave0,
    input chave1,
    output [3:0] outX
);

quatroUm(inA[0], inB[0], inC[0], inD[0], chave0, chave1, outX[0]);
quatroUm(inA[1], inB[1], inC[1], inD[1], chave0, chave1, outX[1]);
quatroUm(inA[2], inB[2], inC[2], inD[2], chave0, chave1, outX[2]);
quatroUm(inA[3], inB[3], inC[3], inD[3], chave0, chave1, outX[3]);

endmodule
