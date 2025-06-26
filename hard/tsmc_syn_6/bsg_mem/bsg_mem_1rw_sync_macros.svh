
`ifndef BSG_MEM_1RW_SYNC_MACROS_VH
`define BSG_MEM_1RW_SYNC_MACROS_VH

// TODO: Re-analyze all constants
`define bsg_mem_1rw_sync_1hdrf_macro(words,bits,tag)   \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                              \
      n6_1rw_d``words``_w``bits``_``tag``_1hdrf \
        mem                   \
          (                   \
           .Q(data_o)         \
          ,.ADR()             \
          ,.D(data_i)         \
          ,.WE(w_i)           \
          ,.ME(1'b1)          \
          ,.CLK(clk_i)        \
          ,.TEST1(1'b0)       \
          ,.TEST_RNM(1'b0)    \
          ,.RME(1'b0)         \
          ,.RM(4'b0)          \
          ,.LS(1'b0)          \
          ,.BC0(1'b0)         \
          ,.BC1(1'b0)         \
          ,.BC2(1'b0)         \
          );                  \
    end: macro

`define bsg_mem_1rw_sync_1hdrf_macro_pad(words,bits,tag,sram_bits)   \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                              \
      n6_1rw_d``words``_w``sram_bits``_``tag``_1hdrf \
        mem                                   \
          (                                   \
           .Q(data_o)         \
          ,.ADR()             \
          ,.D({{sram_bits-bits{1'b0}},data_i})         \
          ,.WE(w_i)           \
          ,.ME(1'b1)          \
          ,.CLK(clk_i)        \
          ,.TEST1(1'b0)       \
          ,.TEST_RNM(1'b0)    \
          ,.RME(1'b0)         \
          ,.RM(4'b0)          \
          ,.LS(1'b0)          \
          ,.BC0(1'b0)         \
          ,.BC1(1'b0)         \
          ,.BC2(1'b0)         \
          );                  \
    end: macro

`define bsg_mem_1rw_sync_banked_macro(words,bits,wbank,dbank) \
  if (harden_p && els_p == words && width_p == bits) begin: macro \
    bsg_mem_1rw_sync_banked #(                                              \
      .width_p(width_p)                                                     \
      ,.els_p(els_p)                                                        \
      ,.latch_last_read_p(latch_last_read_p)                                \
      ,.num_width_bank_p(wbank)                                             \
      ,.num_depth_bank_p(dbank)                                             \
      ,.harden_p(harden_p)                                                  \
    ) bmem (                                                                \
      .clk_i(clk_i)                                                         \
      ,.reset_i(reset_i)                                                    \
      ,.v_i(v_i)                                                            \
      ,.w_i(w_i)                                                            \
      ,.addr_i(addr_i)                                                      \
      ,.data_i(data_i)                                                      \
      ,.data_o(data_o)                                                      \
    );                                                                      \
  end: macro

`endif

