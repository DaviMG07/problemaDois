module decodificadorDisplay(
    input umSegundo,
	input [4:0] character,
    output [7:0] displaySegments
);

wire [10:0] aux;

and(aux[0], character[0], !character[1], !character[2], !character[3]);
and(aux[1], !character[0], !character[1], character[2]);
or(displaySegments[0], aux[0], aux[1]);

and(aux[2], !character[0], character[1], character[2]);
and(aux[3], character[0], !character[1], character[2]);
or(displaySegments[1], aux[2], aux[3]);

and(displaySegments[2], !character[0], character[1], !character[2]);

and(aux[4], character[0], character[1], character[2]);
or(displaySegments[3], displaySegments[0], aux[4]);

and(aux[5], !character[0], !character[1], character[2]);
or(displaySegments[4], character[0], aux[5]);

and(aux[6], character[1], !character[2]);
and(aux[7], character[0], character[1]);
and(aux[8], character[0], !character[1], !character[2], !character[3]);
or(displaySegments[5], aux[6], aux[7], aux[8]);

and(aux[9], character[0], character[1], character[2]);
and(aux[10], !character[1], !character[2], !character[3]);
or(displaySegments[6], aux[9], aux[10]);

assign displaySegments[7] = umSegundo;

endmodule
