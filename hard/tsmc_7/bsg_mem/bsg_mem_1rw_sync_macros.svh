
`ifndef BSG_MEM_1RW_SYNC_MACROS_VH
`define BSG_MEM_1RW_SYNC_MACROS_VH

// TODO: Re-analyze all constants
`define bsg_mem_1rw_sync_1rf_macro(words,bits,tag)   \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                              \
      n7_1rw_d``words``_w``bits``_``tag``_1rf \
        mem                                   \
          (                                   \
            .A            (addr_i)            \
          , .CEB          (~v_i)              \
          , .CLK          (clk_i)             \
          , .D            (data_i)            \
          , .DFTBYP       (1'b0)              \
          , .DSLP         (1'b0)              \
          , .DSLPLV       (1'b0)              \
          , .FADIO        (7'b0)              \
          , .PUDELAY_DSLP ()                  \
          , .PUDELAY_SD   ()                  \
          , .Q            (data_o)            \
          , .REDENIO      (1'b0)              \
          , .RTSEL        (2'b10)             \
          , .SD           (1'b0)              \
          , .SE           (1'b0)              \
          , .SIC          (1'b0)              \
          , .SID          (2'b0)              \
          , .SOC          ()                  \
          , .SOD          ()                  \
          , .WEB          (~w_i)              \
          , .WTSEL        (2'b01)             \
          );                                  \
    end: macro

`define bsg_mem_1rw_sync_1rf_macro_pad(words,bits,tag,sram_bits)   \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                              \
      n7_1rw_d``words``_w``sram_bits``_``tag``_1rf \
        mem                                   \
          (                                   \
            .A            (addr_i)            \
          , .CEB          (~v_i)              \
          , .CLK          (clk_i)             \
          , .D            ({{sram_bits-bits{1'b0}},data_i})            \
          , .DFTBYP       (1'b0)              \
          , .DSLP         (1'b0)              \
          , .DSLPLV       (1'b0)              \
          , .FADIO        (7'b0)              \
          , .PUDELAY_DSLP ()                  \
          , .PUDELAY_SD   ()                  \
          , .Q            (data_o)            \
          , .REDENIO      (1'b0)              \
          , .RTSEL        (2'b10)             \
          , .SD           (1'b0)              \
          , .SE           (1'b0)              \
          , .SIC          (1'b0)              \
          , .SID          (2'b0)              \
          , .SOC          ()                  \
          , .SOD          ()                  \
          , .WEB          (~w_i)              \
          , .WTSEL        (2'b01)             \
          );                                  \
    end: macro

`define bsg_mem_1rw_sync_1sram_macro(words,bits,tag) \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                                     \
      n7_1rw_d``words``_w``bits``_``tag``_1sram      \
        mem                                          \
          (                                   \
  .SD('b0)  \
  ,.DSLP('b0)  \
  ,.CLK(clk_i)  \
  ,.CEB(~v_i)  \
  ,.WEB(~w_i)  \
  ,.A(addr_i)  \
  ,.BWEB('b0)  \
  ,.D(data_i)  \
  ,.Q(data_o)  \
  ,.PUDELAY_SD()  \
  ,.PUDELAY_DSLP()  \
  ,.BIST('b0)  \
  ,.CEBM('b0)  \
  ,.WEBM('b0)  \
  ,.AM('b0)  \
  ,.BWEBM('b0)  \
  ,.DM('b0)  \
  ,.FADIO('b0)  \
  ,.REDENIO('b0)  \
  ,.SE('b0)  \
  ,.DFTBYP('b0)  \
  ,.SIC('b0)  \
  ,.SID('b0)  \
  ,.SOC()  \
  ,.SOD()  \
  ,.DSLPLV('b0)  \
  ,.RTSEL('b0)  \
  ,.WTSEL('b0)  \
          );                                  \
    end: macro

`define bsg_mem_1rw_sync_1hdsram_macro(words,bits,tag) \
  if (harden_p && els_p == words && width_p == bits) \
    begin: macro                                     \
      n7_1rw_d``words``_w``bits``_``tag``_1hdsram    \
        mem                                          \
          ( .CLK   ( clk_i  )                        \
          , .A     ( addr_i )                        \
          , .D     ( data_i )                        \
          , .Q     ( data_o )                        \
          , .CEN   ( ~v_i   )                        \
          , .GWEN  ( ~w_i   )                        \
          , .RET1N ( 1'b1   )                        \
          , .STOV  ( 1'b0   )                        \
          , .EMA   ( 3'b101 )                        \
          , .EMAW  ( 2'b00  )                        \
          , .EMAS  ( 1'b0   )                        \
          , .WABL  ( 1'b1   )                        \
          , .WABLM ( 2'b00  )                        \
          );                                         \
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

