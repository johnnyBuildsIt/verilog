module counter_7Seg (
  input i_Clk,
  input i_Switch_1,
  output o_Segment2_A,
  output o_Segment2_B,
  output o_Segment2_C,
  output o_Segment2_D,
  output o_Segment2_E,
  output o_Segment2_F,
  output o_Segment2_G);

  wire w_switch;
  wire w_Segment2_A;
  wire w_Segment2_B;
  wire w_Segment2_C;
  wire w_Segment2_D;
  wire w_Segment2_E;
  wire w_Segment2_F;
  wire w_Segment2_G;
  reg r_switch = 1'b0;
  reg [3:0] r_counter = 4'b0000;

  debounce_switch debouncer(
    .i_Clk(i_Clk),
    .i_Switch(i_Switch_1),
    .o_Switch(w_switch)
  );

  always @(posedge i_Clk) begin
    r_switch <= w_switch;

    if (w_switch == 1'b1 && r_switch == 1'b0) begin
      if (r_counter == 9) begin
        r_counter <= 0;
      end else begin
        r_counter <= r_counter + 1;
      end
    end
  end

  binary_to_7Seg decoder(
    .i_Clk(i_Clk),
    .i_Binary_Num(r_counter),
    .o_Seg_A(w_Segment2_A),
    .o_Seg_B(w_Segment2_B),
    .o_Seg_C(w_Segment2_C),
    .o_Seg_D(w_Segment2_D),
    .o_Seg_E(w_Segment2_E),
    .o_Seg_F(w_Segment2_F),
    .o_Seg_G(w_Segment2_G)
  );

  assign o_Segment2_A = ~w_Segment2_A;
  assign o_Segment2_B = ~w_Segment2_B;
  assign o_Segment2_C = ~w_Segment2_C;
  assign o_Segment2_D = ~w_Segment2_D;
  assign o_Segment2_E = ~w_Segment2_E;
  assign o_Segment2_F = ~w_Segment2_F;
  assign o_Segment2_G = ~w_Segment2_G;
    
endmodule