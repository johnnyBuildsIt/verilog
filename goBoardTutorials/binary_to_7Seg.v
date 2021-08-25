module binary_to_7Seg (
    input i_Clk,
    input [3:0] i_Binary_Num,
    output o_Seg_A,
    output o_Seg_B,
    output o_Seg_C,
    output o_Seg_D,
    output o_Seg_E,
    output o_Seg_F,
    output o_Seg_G);

reg [6:0] r_num_encoding = 7'b0000000;

always @(posedge i_Clk) begin
    case (i_Binary_Num)
        4'b0000: r_num_encoding <= 7'b1111110; // 0
        4'b0001: r_num_encoding <= 7'b0110000; // 1
        4'b0010: r_num_encoding <= 7'b1101101; // 2
        4'b0011: r_num_encoding <= 7'b1111001; // 3
        4'b0100: r_num_encoding <= 7'b0110011; // 4
        4'b0101: r_num_encoding <= 7'b1011011; // 5
        4'b0110: r_num_encoding <= 7'b1011111; // 6
        4'b0111: r_num_encoding <= 7'b1110000; // 7
        4'b1000: r_num_encoding <= 7'b1111111; // 8
        4'b1001: r_num_encoding <= 7'b1110011; // 9
        4'b1010: r_num_encoding <= 7'b0000001; // -
        4'b1011: r_num_encoding <= 7'b0000001; // -
        4'b1100: r_num_encoding <= 7'b0000001; // -
        4'b1101: r_num_encoding <= 7'b0000001; // -
        4'b1110: r_num_encoding <= 7'b0000001; // -
        4'b1111: r_num_encoding <= 7'b0000001; // -
        default: r_num_encoding <= 7'b1111111; // -
    endcase
end

assign o_Seg_A = r_num_encoding[6];
assign o_Seg_B = r_num_encoding[5];
assign o_Seg_C = r_num_encoding[4];
assign o_Seg_D = r_num_encoding[3];
assign o_Seg_E = r_num_encoding[2];
assign o_Seg_F = r_num_encoding[1];
assign o_Seg_G = r_num_encoding[0];

endmodule