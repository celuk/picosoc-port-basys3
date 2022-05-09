module progmem (
    // Closk & reset
    input wire clk,
    input wire rstn,

    // PicoRV32 bus interface
    input  wire        valid,
    output wire        ready,
    input  wire [31:0] addr,
    output wire [31:0] rdata
);

  // ============================================================================

  localparam MEM_SIZE_BITS = 10;  // In 32-bit words
  localparam MEM_SIZE = 1 << MEM_SIZE_BITS;
  localparam MEM_ADDR_MASK = 32'h0010_0000;

  // ============================================================================

  wire [MEM_SIZE_BITS-1:0] mem_addr;
  reg  [             31:0] mem_data;
  reg  [             31:0] mem      [0:MEM_SIZE];

  initial begin

  mem['h0000] <= 32'h00000093;
  mem['h0001] <= 32'h00000193;
  mem['h0002] <= 32'h00000213;
  mem['h0003] <= 32'h00000293;
  mem['h0004] <= 32'h00000313;
  mem['h0005] <= 32'h00000393;
  mem['h0006] <= 32'h00000413;
  mem['h0007] <= 32'h00000493;
  mem['h0008] <= 32'h00000513;
  mem['h0009] <= 32'h00000593;
  mem['h000A] <= 32'h00000613;
  mem['h000B] <= 32'h00000693;
  mem['h000C] <= 32'h00000713;
  mem['h000D] <= 32'h00000793;
  mem['h000E] <= 32'h00000813;
  mem['h000F] <= 32'h00000893;
  mem['h0010] <= 32'h00000913;
  mem['h0011] <= 32'h00000993;
  mem['h0012] <= 32'h00000a13;
  mem['h0013] <= 32'h00000a93;
  mem['h0014] <= 32'h00000b13;
  mem['h0015] <= 32'h00000b93;
  mem['h0016] <= 32'h00000c13;
  mem['h0017] <= 32'h00000c93;
  mem['h0018] <= 32'h00000d13;
  mem['h0019] <= 32'h00000d93;
  mem['h001A] <= 32'h00000e13;
  mem['h001B] <= 32'h00000e93;
  mem['h001C] <= 32'h00000f13;
  mem['h001D] <= 32'h00000f93;
  mem['h001E] <= 32'h03000537;
  mem['h001F] <= 32'h00100593;
  mem['h0020] <= 32'h00b52023;
  mem['h0021] <= 32'h00000513;
  mem['h0022] <= 32'h00a52023;
  mem['h0023] <= 32'h00450513;
  mem['h0024] <= 32'hfe254ce3;
  mem['h0025] <= 32'h03000537;
  mem['h0026] <= 32'h00300593;
  mem['h0027] <= 32'h00b52023;
  mem['h0028] <= 32'h00000517;
  mem['h0029] <= 32'h20c50513;
  mem['h002A] <= 32'h00000593;
  mem['h002B] <= 32'h00000613;
  mem['h002C] <= 32'h00c5dc63;
  mem['h002D] <= 32'h00052683;
  mem['h002E] <= 32'h00d5a023;
  mem['h002F] <= 32'h00450513;
  mem['h0030] <= 32'h00458593;
  mem['h0031] <= 32'hfec5c8e3;
  mem['h0032] <= 32'h03000537;
  mem['h0033] <= 32'h00700593;
  mem['h0034] <= 32'h00b52023;
  mem['h0035] <= 32'h00000513;
  mem['h0036] <= 32'h00000593;
  mem['h0037] <= 32'h00b55863;
  mem['h0038] <= 32'h00052023;
  mem['h0039] <= 32'h00450513;
  mem['h003A] <= 32'hfeb54ce3;
  mem['h003B] <= 32'h03000537;
  mem['h003C] <= 32'h00f00593;
  mem['h003D] <= 32'h00b52023;
  mem['h003E] <= 32'h144000ef;
  mem['h003F] <= 32'h0000006f;
  mem['h0040] <= 32'h020002b7;
  mem['h0041] <= 32'h12000313;
  mem['h0042] <= 32'h00629023;
  mem['h0043] <= 32'h000281a3;
  mem['h0044] <= 32'h02060863;
  mem['h0045] <= 32'h00800f13;
  mem['h0046] <= 32'h0ff67393;
  mem['h0047] <= 32'h0073de93;
  mem['h0048] <= 32'h01d28023;
  mem['h0049] <= 32'h010eee93;
  mem['h004A] <= 32'h01d28023;
  mem['h004B] <= 32'h00139393;
  mem['h004C] <= 32'h0ff3f393;
  mem['h004D] <= 32'hffff0f13;
  mem['h004E] <= 32'hfe0f12e3;
  mem['h004F] <= 32'h00628023;
  mem['h0050] <= 32'h04058663;
  mem['h0051] <= 32'h00800f13;
  mem['h0052] <= 32'h00054383;
  mem['h0053] <= 32'h0073de93;
  mem['h0054] <= 32'h01d28023;
  mem['h0055] <= 32'h010eee93;
  mem['h0056] <= 32'h01d28023;
  mem['h0057] <= 32'h0002ce83;
  mem['h0058] <= 32'h002efe93;
  mem['h0059] <= 32'h001ede93;
  mem['h005A] <= 32'h00139393;
  mem['h005B] <= 32'h01d3e3b3;
  mem['h005C] <= 32'h0ff3f393;
  mem['h005D] <= 32'hffff0f13;
  mem['h005E] <= 32'hfc0f1ae3;
  mem['h005F] <= 32'h00750023;
  mem['h0060] <= 32'h00150513;
  mem['h0061] <= 32'hfff58593;
  mem['h0062] <= 32'hfb9ff06f;
  mem['h0063] <= 32'h08000313;
  mem['h0064] <= 32'h006281a3;
  mem['h0065] <= 32'h00008067;
  mem['h0066] <= 32'hfe010113;
  mem['h0067] <= 32'h00112e23;
  mem['h0068] <= 32'h00812c23;
  mem['h0069] <= 32'h02010413;
  mem['h006A] <= 32'h00050793;
  mem['h006B] <= 32'hfef407a3;
  mem['h006C] <= 32'hfef44703;
  mem['h006D] <= 32'h00a00793;
  mem['h006E] <= 32'h00f71663;
  mem['h006F] <= 32'h00d00513;
  mem['h0070] <= 32'hfd9ff0ef;
  mem['h0071] <= 32'h020007b7;
  mem['h0072] <= 32'h00878793;
  mem['h0073] <= 32'hfef44703;
  mem['h0074] <= 32'h00e7a023;
  mem['h0075] <= 32'h00000013;
  mem['h0076] <= 32'h01c12083;
  mem['h0077] <= 32'h01812403;
  mem['h0078] <= 32'h02010113;
  mem['h0079] <= 32'h00008067;
  mem['h007A] <= 32'hfe010113;
  mem['h007B] <= 32'h00112e23;
  mem['h007C] <= 32'h00812c23;
  mem['h007D] <= 32'h02010413;
  mem['h007E] <= 32'hfea42623;
  mem['h007F] <= 32'h01c0006f;
  mem['h0080] <= 32'hfec42783;
  mem['h0081] <= 32'h00178713;
  mem['h0082] <= 32'hfee42623;
  mem['h0083] <= 32'h0007c783;
  mem['h0084] <= 32'h00078513;
  mem['h0085] <= 32'hf85ff0ef;
  mem['h0086] <= 32'hfec42783;
  mem['h0087] <= 32'h0007c783;
  mem['h0088] <= 32'hfe0790e3;
  mem['h0089] <= 32'h00000013;
  mem['h008A] <= 32'h00000013;
  mem['h008B] <= 32'h01c12083;
  mem['h008C] <= 32'h01812403;
  mem['h008D] <= 32'h02010113;
  mem['h008E] <= 32'h00008067;
  mem['h008F] <= 32'hff010113;
  mem['h0090] <= 32'h00112623;
  mem['h0091] <= 32'h00812423;
  mem['h0092] <= 32'h01010413;
  mem['h0093] <= 32'h030007b7;
  mem['h0094] <= 32'h0000c737;
  mem['h0095] <= 32'hffb70713;
  mem['h0096] <= 32'h00e7a023;
  mem['h0097] <= 32'h020007b7;
  mem['h0098] <= 32'h00478793;
  mem['h0099] <= 32'h0d900713;
  mem['h009A] <= 32'h00e7a023;
  mem['h009B] <= 32'h001007b7;
  mem['h009C] <= 32'h29c78513;
  mem['h009D] <= 32'hf75ff0ef;
  mem['h009E] <= 32'h001007b7;
  mem['h009F] <= 32'h2a878513;
  mem['h00A0] <= 32'hf69ff0ef;
  mem['h00A1] <= 32'h00000793;
  mem['h00A2] <= 32'h00078513;
  mem['h00A3] <= 32'h00c12083;
  mem['h00A4] <= 32'h00812403;
  mem['h00A5] <= 32'h01010113;
  mem['h00A6] <= 32'h00008067;
  mem['h00A7] <= 32'h6c6c6548;
  mem['h00A8] <= 32'h6a64206f;
  mem['h00A9] <= 32'h000a6a64;
  mem['h00AA] <= 32'h0000000a;

  end

  always @(posedge clk) mem_data <= mem[mem_addr];

  // ============================================================================

  reg o_ready;

  always @(posedge clk or negedge rstn)
    if (!rstn) o_ready <= 1'd0;
    else o_ready <= valid && ((addr & MEM_ADDR_MASK) != 0);

  // Output connectins
  assign ready    = o_ready;
  assign rdata    = mem_data;
  assign mem_addr = addr[MEM_SIZE_BITS+1:2];

endmodule

