
`ifndef BSG_MEM_1R1W_SYNC_MACROS_VH
`define BSG_MEM_1R1W_SYNC_MACROS_VH

// Synchronous Two-Port Register File
// Compatible with Following compilers:
// TODO: Re-analyze all constants
`define bsg_mem_1r1w_sync_2rf_macro(words,bits,tag) \
 if (harden_p && els_p == words && width_p == bits) \
    begin: macro                                    \
    n7_1r1w_d``words``_w``bits``_``tag``_2rf        \
      mem (                                         \
      .AA            (r_addr_i)                     \
      ,.AB           (w_addr_i)                     \
      ,.CLKR         (clk_i)                        \
      ,.CLKW         (clk_i)                        \
      ,.D            (w_data_i)                     \
      ,.DFTBYP       (1'b0)                         \
      ,.DSLP         (1'b0)                         \
      ,.DSLPLV       (1'b0)                         \
      ,.FADIO        (5'b0)                         \
      ,.KP           (2'b0)                         \
      ,.PUDELAY_DSLP ()                             \
      ,.PUDELAY_SD   ()                             \
      ,.Q            (r_data_o)                     \
      ,.RCT          (2'b0)                         \
      ,.REB          (~r_v_i)                       \
      ,.REDENIO      (1'b0)                         \
      ,.SD           (1'b0)                         \
      ,.SE           (1'b0)                         \
      ,.SIC          (1'b0)                         \
      ,.SID          (2'b0)                         \
      ,.SOC          ()                             \
      ,.SOD          ()                             \
      ,.WCT          (2'b0)                         \
      ,.WEB          (~w_v_i)                       \
    );                                              \
  end

`define bsg_mem_1r1w_sync_2rf_macro_pad(words,bits,tag,sram_bits) \
 if (harden_p && els_p == words && width_p == bits)               \
    begin: macro                                                  \
    n7_1r1w_d``words``_w``sram_bits``_``tag``_2rf                 \
      mem (                                                       \
      .AA            (r_addr_i)                                   \
      ,.AB           (w_addr_i)                                   \
      ,.CLKR         (clk_i)                                      \
      ,.CLKW         (clk_i)                                      \
      ,.D            ({{sram_bits-bits{1'b0}},w_data_i})          \
      ,.DFTBYP       (1'b0)                                       \
      ,.DSLP         (1'b0)                                       \
      ,.DSLPLV       (1'b0)                                       \
      ,.FADIO        (5'b0)                                       \
      ,.KP           (2'b0)                                       \
      ,.PUDELAY_DSLP ()                                           \
      ,.PUDELAY_SD   ()                                           \
      ,.Q            (r_data_o)                                   \
      ,.RCT          (2'b0)                                       \
      ,.REB          (~r_v_i)                                     \
      ,.REDENIO      (1'b0)                                       \
      ,.SD           (1'b0)                                       \
      ,.SE           (1'b0)                                       \
      ,.SIC          (1'b0)                                       \
      ,.SID          (2'b0)                                       \
      ,.SOC          ()                                           \
      ,.SOD          ()                                           \
      ,.WCT          (2'b0)                                       \
      ,.WEB          (~w_v_i)                                     \
    );                                                            \
  end

// Ultra High Density Two Port 1R1RW Register File RVT MVT Compiler
`define bsg_mem_1r1rw_sync_2rf_macro(words,bits,tag)\
  if (harden_p && els_p == words && width_p == bits)         \
    begin: macro                                             \
    n7_1r1rw_d``words``_w``bits``_``tag``_2rf              \
      mem (                                                  \
      .AA              (r_addr_i)            \
      ,.AB              (w_addr_i)            \
      ,.CLKR            (clk_i)               \
      ,.CLKW            (clk_i)               \
      ,.D               (w_data_i)            \
      ,.DFTBYP          (1'b0)                \
      ,.DSLP            (1'b0)                \
      ,.DSLPLV          (1'b0)                \
      ,.FADIO           (5'b0)                \
      ,.KP              (2'b0)                \
      ,.PUDELAY_DSLP    ()                \
      ,.PUDELAY_SD      ()                \
      ,.Q               (r_data_o)            \
      ,.RCT             (2'b0)                \
      ,.REB             (~r_v_i)              \
      ,.REDENIO         (1'b0)                \
      ,.SD              (1'b0)                \
      ,.SE              (1'b0)                \
      ,.SIC             (1'b0)                \
      ,.SID             (2'b0)                \
      ,.SOC             ()                \
      ,.SOD             ()                \
      ,.WCT             (2'b0)                \
      ,.WEB             (~w_v_i)              \
    );         \
  end

`define bsg_mem_1r1w_sync_2sram_macro(words,bits,tag)\
  if (harden_p && els_p == words && width_p == bits)          \
    begin: macro                                              \
    n7_1r1w_d``words``_w``bits``_``tag``_2sram              \
      mem (                                                   \
 .AA           (r_addr_i) \
,.CLKA         (clk_i) \
,.DA           ('b0) \
,.QA           (r_data_o) \
,.CEBA         (~r_v_i) \
,.WEBA         ( 1'b1) \
,.AB           (w_addr_i) \
,.CLKB         (clk_i) \
,.QB           () \
,.DB           ( w_data_i) \
,.CEBB         ( ~w_v_i) \
,.WEBB         (~w_v_i) \
,.SD           ( 'b0) \
,.DSLP         ( 'b0) \
,.PUDELAY_SD   () \
,.PUDELAY_DSLP () \
,.FADIO        ( 'b0) \
,.REDENIO      ( 'b0) \
,.SE           ( 'b0) \
,.DFTBYP       ( 'b0) \
,.SICA         ( 'b0) \
,.SIDA         ( 'b0) \
,.SOCA         ( ) \
,.SODA         ( ) \
,.SICB         ( 'b0) \
,.SIDB         ( 'b0) \
,.SOCB         ( ) \
,.SODB         ( ) \
,.DSLPLV       ( 'b0) \
,.RTSEL        ( 2'b10) \
,.WTSEL        ( 2'b01) \
    );         \
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

