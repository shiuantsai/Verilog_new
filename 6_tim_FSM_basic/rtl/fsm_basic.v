module fsm_basic(wi, clk, reset, zo);
input wi, clk, reset;
output zo;

parameter IDLE = 2'b00; 
parameter S0   = 2'b01;
parameter S1   = 2'b10;

reg [1:0] curr_state;
reg zo;

always @(posedge clk, negedge reset)
  if (!reset)  begin 
    curr_state <=  IDLE;
  end
  else begin
    case (curr_state)
      IDLE   : if (wi)  curr_state <= S0;
               else     curr_state <= IDLE;
      S0     : if (wi)  curr_state <= S1;
               else     curr_state <= IDLE;
      S1     : if (wi)  curr_state <= S1;
               else     curr_state <= IDLE;
      default: curr_state <= IDLE;
    endcase
    end
  

always @(*)
  case (curr_state)
    IDLE    : zo = 1'b0;
    S0      : zo = 1'b0;
    S1      : zo = 1'b0;
    default : zo = 1'b0;
  endcase
endmodule
