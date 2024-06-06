module flipFlopD(
    input clock,
    input data,
    input reset,
    output reg outQ
);

always@(posedge clock or posedge reset) begin
    if (reset) begin
        outQ <= 0;
    end
    else begin
        outQ <= data;
    end
end

endmodule

module flipFlopT(
    input clock,
    input toggle,
    input reset,
    output reg outQ
);

always@(posedge clock or posedge reset) begin
    if (reset) begin
        outQ <= 0;
    end
    else begin
        outQ <= ~outQ;
    end
end

endmodule