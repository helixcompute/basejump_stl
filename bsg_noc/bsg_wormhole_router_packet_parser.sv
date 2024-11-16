// this module parses a packet as it comes in from a fifo
// indicating where the first and last word are
//
// a typical use case is to build an endpoint for a wormhole network
// which might deque the header (first word) 

module bsg_wormhole_router_packet_parser #(parameter `BSG_INV_PARAM(payload_len_bits_p))
   (input clk_i
    , input reset_i
    , input fifo_v_i
    , input [payload_len_bits_p-1:0] fifo_payload_len_i

    // this cycle's word was requested to deque
    , input fifo_yumi_i

    // we completed transferring all of the flits on the previous cycle
    , output last_flit_r_o

    // detected first flit of packet
    , output first_flit_o
    );

  bsg_wormhole_router_input_control #(.output_dirs_p(1)
                                      ,.payload_len_bits_p(payload_len_bits_p)
                                     ) ic
  (.clk_i(clk_i)
  ,.reset_i(reset_i)
  ,.fifo_v_i(fifo_v_i)
  ,.fifo_decoded_dest_i(1'b0)
  ,.fifo_payload_len_i(fifo_payload_len_i)
  ,.fifo_yumi_i(fifo_yumi_i)
  ,.reqs_o()
  ,.release_o(last_word_r_o)
  ,.detected_header_o(first_word_o)
  );

endmodule
