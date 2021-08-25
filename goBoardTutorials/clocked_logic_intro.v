module Clocked_Logic_Intro(
  input i_Clk,
  input i_Switch_1,
  output o_LED_1);

reg r_Switch_1 = 1'b0;
reg r_LED_1 = 1'b0;
wire w_switch;

debounce_dwitch debounce(
  .i_Clk(i_Clk),
  .i_Switch(i_Switch_1),
  .o_Switch(w_switch)
); 

always @(posedge i_Clk) begin
  r_Switch_1 <= w_switch;

  if (!w_switch && r_Switch_1) begin // falling edge switch detection
    r_LED_1 <= ~r_LED_1;
  end
end

assign o_LED_1 = r_LED_1;

endmodule