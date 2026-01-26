class dma_subscriber extends uvm_subscriber#(dma_sequence_item);
  `uvm_component_utils(dma_subscriber)
  dma_sequence_item tx;
  real total_coverage;
  
  covergroup dma_reg_cg;
    write_enable:coverpoint tx.wr_en;
    read_enable:coverpoint tx.rd_en;
    reg_address:coverpoint tx.addr{
                                    bins intr_reg={32'h400};
                                    bins ctrl_reg={32'h404};
                                    bins io_addr_reg={32'h408};
                                    bins mem_addr_reg={32'h40C};
                                    bins extra_info_reg={32'h410};
                                    bins status_reg={32'h414};
                                    bins transfer_count_reg={32'h418};
                                    bins desc_addr_reg={32'h41C};
                                    bins error_status={32'h420};
                                    bins config_reg={32'h424};
                                  }
    addr_X_wr_en:cross write_enable,reg_address;
    addr_X_rd_en:cross read_enable,reg_address;
  endgroup
  
  function new(string name="dma_subsriber",uvm_component parent=null);
    super.new(name,parent);
    dma_reg_cg=new();
  endfunction
  
  function void write(dma_sequence_item t);
    tx=t;
    dma_reg_cg.sample();
  endfunction
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    total_coverage = dma_reg_cg.get_coverage();
  endfunction
  
  function void report_phase(uvm_phase phase);
    `uvm_info(get_full_name(),$sformatf("Total coverage = %0.2f",total_coverage),UVM_MEDIUM)
  endfunction
  
endclass
