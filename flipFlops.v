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

module flipFlopTCompleto(
    input clock,
    input toggle,
    input preset,
    input reset,
    output reg outQ
);

always@(posedge clock) begin
    if (reset) begin
        outQ <= 0;
    end
    else begin
        if (preset) begin
            outQ <= 1;
        end
        else begin
            outQ <= ~outQ;
        end
    end
end

endmodule
