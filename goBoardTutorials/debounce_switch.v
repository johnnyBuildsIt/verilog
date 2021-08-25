module debounce_switch(
  input i_Clk,
  input i_Switch,
  output o_Switch);

  parameter DEBOUNCE_COUNT = 250000;

  reg r_switch = 1'b0;
  reg [17:0] r_count = 0; 

  always @(posedge i_Clk) begin
    if (i_Switch != r_switch && r_count < DEBOUNCE_COUNT) begin
      r_count <= r_count + 1;
    end else if (r_count ==  DEBOUNCE_COUNT) begin
      r_switch <= i_Switch;
      r_count <= 0;
    end else begin
      r_count <= 0;
    end
  end

  assign o_Switch = r_switch;

endmodule