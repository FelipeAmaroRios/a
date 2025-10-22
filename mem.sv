module mem (
  input  logic        clk, we,
  input  logic [31:0] a, wd,
  output logic [31:0] rd);
  
  logic  [31:0] RAM [0:511]; 

  // initialize memory with data from the assembled .hex file
  initial begin
    $readmemh("riscv.hex", RAM); 
  end

  assign rd = RAM[a[31:2]]; // word aligned [cite: 37]

  always_ff @(posedge clk)
    if (we)
      RAM[a[31:2]] <= wd; 
endmodule