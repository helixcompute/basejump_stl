
`ifndef BSG_MEM_1R1W_SYNC_MACROS_VH
`define BSG_MEM_1R1W_SYNC_MACROS_VH

// Synchronous Two-Port Register File
// Compatible with Following compilers:
// rf_2p_hsc_rvt_mvt (Constant values are from compiler README at 0.65v)
`define bsg_mem_1r1w_sync_2rf_macro(words,bits,tag)\
  if (harden_p && els_p == words && width_p == 39 && "tag" == "lane")\
    begin: macro_z                                            \
    gf12_1r1w_d``words``_w40_``tag``_2rf                      \
      mem (                                                   \
      .CLKA   (clk_i)                                         \
      ,.CLKB  (clk_i)                                         \
      ,.CENA  (~r_v_i)                                        \
      ,.AA    (r_addr_i)                                      \
      ,.QA    (r_data_o)                                      \
      ,.CENB  (~w_v_i)                                        \
      ,.AB    (w_addr_i)                                      \
      ,.DB    ({1'b0,w_data_i})                               \
      ,.EMAA  (3'b100)                                        \
      ,.EMAB  (3'b100)                                        \
      ,.EMASA (1'b1)                                          \
      ,.STOV  (1'b0)                                          \
      ,.RET1N (1'b1)                                          \
      ,.WABL  (1'b1)                                          \
      ,.WABLM (2'b01)                                         \
    );                                                        \
  end else if (harden_p && els_p == words && width_p == 67 && "tag" == "me")\
    begin: macro_z2                                            \
    gf12_1r1w_d``words``_w68_``tag``_2rf                      \
      mem (                                                   \
      .CLKA   (clk_i)                                         \
      ,.CLKB  (clk_i)                                         \
      ,.CENA  (~r_v_i)                                        \
      ,.AA    (r_addr_i)                                      \
      ,.QA    (r_data_o)                                      \
      ,.CENB  (~w_v_i)                                        \
      ,.AB    (w_addr_i)                                      \
      ,.DB    ({1'b0,w_data_i})                               \
      ,.EMAA  (3'b100)                                        \
      ,.EMAB  (3'b100)                                        \
      ,.EMASA (1'b1)                                          \
      ,.STOV  (1'b0)                                          \
      ,.RET1N (1'b1)                                          \
      ,.WABL  (1'b1)                                          \
      ,.WABLM (2'b01)                                         \
    );                                                        \
  end else if (harden_p && els_p == words && width_p == bits) \
    begin: macro                                              \
    gf12_1r1w_d``words``_w``bits``_``tag``_2rf                \
      mem (                                                   \
      .CLKA   (clk_i)                                         \
      ,.CLKB  (clk_i)                                         \
      ,.CENA  (~r_v_i)                                        \
      ,.AA    (r_addr_i)                                      \
      ,.QA    (r_data_o)                                      \
      ,.CENB  (~w_v_i)                                        \
      ,.AB    (w_addr_i)                                      \
      ,.DB    (w_data_i)                                      \
      ,.EMAA  (3'b100)                                        \
      ,.EMAB  (3'b100)                                        \
      ,.EMASA (1'b1)                                          \
      ,.STOV  (1'b0)                                          \
      ,.RET1N (1'b1)                                          \
      ,.WABL  (1'b1)                                          \
      ,.WABLM (2'b01)                                         \
    );                                                        \
  end

// Ultra High Density Two Port 1R1RW Register File RVT MVT Compiler
`define bsg_mem_1r1rw_sync_2rf_macro(words,bits,tag)\
  if (harden_p && els_p == words && width_p == bits)         \
    begin: macro                                             \
    gf12_1r1rw_d``words``_w``bits``_``tag``_2rf              \
      mem (                                                  \
      .CLK     (clk_i)                                       \
      ,.CENA   (~r_v_i)                                      \
      ,.AA     (r_addr_i)                                    \
      ,.QA     (r_data_o)                                    \
      ,.QB     (        )                                    \
      ,.CENB   (~w_v_i)                                      \
      ,.AB     (w_addr_i)                                    \
      ,.DB     (w_data_i)                                    \
      ,.GWENB  (~w_v_i)                                      \
      ,.EMA    (3'b011)                                      \
      ,.EMAP   (1'b0)                                        \
      ,.EMAW   (2'b01)                                       \
      ,.EMAS   (1'b0)                                        \
      ,.WABL   (1'b1)                                        \
      ,.WABLM  (2'b00)                                       \
      ,.RESETN (1'b1)                                        \
      ,.STOV   (1'b0)                                        \
      ,.STOVAB (1'b0)                                        \
      ,.RET1N  (1'b1)                                        \
    );         \
  end

`define bsg_mem_1r1w_sync_2sram_macro(words,bits,tag)\
  if (harden_p && els_p == words && width_p == bits)          \
    begin: macro                                              \
    gf12_1r1w_d``words``_w``bits``_``tag``_2sram              \
      mem (                                                   \
      .CLKA   (clk_i)                                         \
      ,.CLKB  (clk_i)                                         \
      ,.CENA  (~r_v_i)                                        \
      ,.AA    (r_addr_i)                                      \
      ,.QA    (r_data_o)                                      \
      ,.CENB  (~w_v_i)                                        \
      ,.AB    (w_addr_i)                                      \
      ,.DB    (w_data_i)                                      \
      ,.EMAA  (3'b011)                                        \
      ,.EMAB  (3'b011)                                        \
      ,.EMASA (1'b0)                                          \
      ,.STOV  (1'b0)                                          \
      ,.RET1N (1'b1)                                          \
    );                                                        \
  end



`define bsg_mem_1r1w_sync_banked_macro(words,bits,wbank,dbank) \
  if (harden_p && els_p == words && width_p == bits) begin: macro \
    bsg_mem_1r1w_sync_banked #(                                             \
      .width_p(width_p)                                                     \
      ,.els_p(els_p)                                                        \
      ,.read_write_same_addr_p(read_write_same_addr_p)                      \
      ,.num_width_bank_p(wbank)                                             \
      ,.num_depth_bank_p(dbank)                                             \
    ) bmem (                                                                \
      .clk_i(clk_i)                                                         \
      ,.reset_i(reset_i)                                                    \
      ,.w_v_i(w_v_i)                                                        \
      ,.w_addr_i(w_addr_i)                                                  \
      ,.w_data_i(w_data_i)                                                  \
      ,.r_v_i(r_v_i)                                                        \
      ,.r_addr_i(r_addr_i)                                                  \
      ,.r_data_o(r_data_o)                                                  \
    );                                                                      \
  end: macro

      
`endif

