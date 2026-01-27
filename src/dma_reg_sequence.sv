class dma_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(dma_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="dma_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")
      
   $display("===========================================================================================");
    
    $display("FRONTDOOR write to interrupt register");
    reg_blk.intr_reg.write(status,32'hFFFF_FFFF); 
      des=reg_blk.intr_reg.get();
      mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.intr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM)
    
      $display("FRONTDOOR read from interrupt register");
      reg_blk.intr_reg.read(status,rdata);
      des=reg_blk.intr_reg.get();
      mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.intr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM)
    
     $display("BACKDOOR write to interrupt register");
    reg_blk.intr_reg.write(status,32'h0FFF_FFFF,UVM_BACKDOOR);
    des=reg_blk.intr_reg.get();
    mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.intr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM)
    
    $display("BACKDOOR read from interrupt register");
    reg_blk.intr_reg.read(status,rdata_bd,UVM_BACKDOOR);
    des=reg_blk.intr_reg.get();
    mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
    reg_blk.intr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM)
    
    $display("RESET check on interrupt register");
    reset=reg_blk.intr_reg.get_reset();
    reg_blk.intr_reg.reset();     //to reset the register
    des=reg_blk.intr_reg.get();
    mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    
  $display("===========================================================================================");
    
    $display("FRONTDOOR write to control register");
      reg_blk.ctrl_reg.write(status,32'h0000_0001);
      des=reg_blk.ctrl_reg.get();
      mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
    
    $display("FRONTDOOR read from control register");
      reg_blk.ctrl_reg.read(status,rdata);
      des=reg_blk.ctrl_reg.get();
      mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
    
    $display("BACKDOOR write to control register");
    reg_blk.ctrl_reg.write(status,32'h0000_0001,UVM_BACKDOOR);
    des=reg_blk.ctrl_reg.get();
    mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
    
    $display("BACKDOOR read from control register");
    reg_blk.ctrl_reg.read(status,rdata_bd,UVM_BACKDOOR);
    des=reg_blk.ctrl_reg.get();
    mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
    reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
    
    $display("RESET check on control register");
    reset=reg_blk.ctrl_reg.get_reset();
    reg_blk.ctrl_reg.reset();  //to reset the register
    des=reg_blk.ctrl_reg.get();
    mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
  $display("===========================================================================================");

      $display("FRONTDOOR write to IO_ADDR register");
      reg_blk.io_addr_reg.write(status,32'hA5A5_A5A5);
      des=reg_blk.io_addr_reg.get();
      mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
    
    $display("FRONTDOOR read from IO_ADDR register");
      reg_blk.io_addr_reg.read(status,rdata);
      des=reg_blk.io_addr_reg.get();
      mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
     
    $display("BACKDOOR write to IO_ADDR register");
    reg_blk.io_addr_reg.write(status,32'hA5A5_A5A5,UVM_BACKDOOR);
    des=reg_blk.io_addr_reg.get();
    mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
    
    $display("BACKDOOR read from IO_ADDR register");
    reg_blk.io_addr_reg.read(status,rdata_bd,UVM_BACKDOOR);
    des=reg_blk.io_addr_reg.get();
    mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
    reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
    
    $display("RESET check on IO_ADDR register");
    reset=reg_blk.io_addr_reg.get_reset();
    reg_blk.io_addr_reg.reset();    //to reset the register
    des=reg_blk.io_addr_reg.get();
    mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
   $display("===========================================================================================");

      $display("FRONTDOOR write to MEM_ADDR register");
      reg_blk.mem_addr_reg.write(status,32'h1234_5678);
      des=reg_blk.mem_addr_reg.get();
      mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
    
    $display("FRONTDOOR read from MEM_ADDR register");
      reg_blk.mem_addr_reg.read(status,rdata);
      des=reg_blk.mem_addr_reg.get();
      mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
    
    $display("BACKDOOR write to MEM_ADDR register");
    reg_blk.mem_addr_reg.write(status,32'h1234_5678,UVM_BACKDOOR);
    des=reg_blk.mem_addr_reg.get();
    mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
    
    $display("BACKDOOR read from MEM_ADDR register");
    reg_blk.mem_addr_reg.read(status,rdata_bd,UVM_BACKDOOR);
    des=reg_blk.mem_addr_reg.get();
    mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
    reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
    
    $display("RESET check on MEM_ADDR register");
    reset=reg_blk.mem_addr_reg.get_reset();
    reg_blk.mem_addr_reg.reset();      //to reset the register
    des=reg_blk.mem_addr_reg.get();
    mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)  
    
  $display("===========================================================================================");

      $display("FRONTDOOR write to EXTRA_INFO register");
      reg_blk.extra_info_reg.write(status,32'hDEAD_BEEF);
      des=reg_blk.extra_info_reg.get();
      mir=reg_blk.extra_info_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("EXTRA_INFO WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)
    
     $display("FRONTDOOR read from EXTRA_INFO register");
     reg_blk.extra_info_reg.read(status,rdata);
      des=reg_blk.extra_info_reg.get();
      mir=reg_blk.extra_info_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("EXTRA_INFO READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)
    
     $display("BACKDOOR write to EXTRA_INFO register");
      reg_blk.extra_info_reg.write(status,32'hDEAD_BEEF,UVM_BACKDOOR);
      des=reg_blk.extra_info_reg.get();
      mir=reg_blk.extra_info_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("EXTRA_INFO WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)
    
      $display("BACKDOOR read from EXTRA_INFO register");
      reg_blk.extra_info_reg.read(status,rdata_bd,UVM_BACKDOOR);
      des=reg_blk.extra_info_reg.get();
      mir=reg_blk.extra_info_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("EXTRA_INFO READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
     reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)
    
     $display("RESET check on EXTRA_INFO register");
     reset=reg_blk.extra_info_reg.get_reset();
     reg_blk.extra_info_reg.reset();       //to reset the register
     des=reg_blk.extra_info_reg.get();
     mir=reg_blk.extra_info_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("EXTRA_INFO RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE) 
    
     $display("===========================================================================================");

       $display("FRONTDOOR write to STATUS register");
       reg_blk.status_reg.write(status,32'hFFFF_FFFF);
       des=reg_blk.status_reg.get();
       mir=reg_blk.status_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("STATUS WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
     reg_blk.status_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for STATUS register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for STATUS register"),UVM_MEDIUM)
    
    /* $display("BACKDOOR poke(write) to STATUS register");
      reg_blk.status_reg.poke(status,32'hFFFF_FFFF);
      des=reg_blk.status_reg.get();
      mir=reg_blk.status_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("STATUS WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE) */
    
      $display("FRONTDOOR read from STATUS register");
      reg_blk.status_reg.read(status,rdata);
      des=reg_blk.status_reg.get();
      mir=reg_blk.status_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("STATUS READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
     reg_blk.status_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for STATUS register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for STATUS register"),UVM_MEDIUM)
    
  /* $display("BACKDOOR read from STATUS register");
      reg_blk.status_reg.read(status,rdata_bd,UVM_BACKDOOR);
      des=reg_blk.status_reg.get();
      mir=reg_blk.status_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("STATUS READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE) */
    
      $display("RESET check on STATUS register");
      reset=reg_blk.status_reg.get_reset();
      reg_blk.status_reg.reset();       //to reset the register
      des=reg_blk.status_reg.get();
      mir=reg_blk.status_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("STATUS RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    $display("===========================================================================================");

      $display("FRONTDOOR write to TRANSFER_COUNT register");
      reg_blk.transfer_count_reg.write(status,32'hFFFF_FFFF);
       des=reg_blk.transfer_count_reg.get();
       mir=reg_blk.transfer_count_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("TRANSFER_COUNT WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.transfer_count_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for TRANSFER_COUNT register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for TRANSFER_COUNT register"),UVM_MEDIUM)
    
   $display("FRONTDOOR read from TRANSFER_COUNT register");
      reg_blk.transfer_count_reg.read(status,rdata);
      des=reg_blk.transfer_count_reg.get();
      mir=reg_blk.transfer_count_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("TRANSFER_COUNT READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.transfer_count_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for TRANSFER_COUNT register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for TRANSFER_COUNT register"),UVM_MEDIUM)
    
   /* $display("BACKDOOR write to TRANSFER_COUNT register");
      reg_blk.transfer_count_reg.write(status,32'hFFFF_FFFF,UVM_BACKDOOR);
      des=reg_blk.transfer_count_reg.get();
      mir=reg_blk.transfer_count_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("TRANSFER_COUNT WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
      $display("BACKDOOR read from TRANSFER_COUNT register");
      reg_blk.transfer_count_reg.read(status,rdata_bd,UVM_BACKDOOR);
      des=reg_blk.transfer_count_reg.get();
      mir=reg_blk.transfer_count_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("TRANSFER_COUNT READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE) */
    
      $display("RESET check on TRANSFER_COUNT register");
      reset=reg_blk.transfer_count_reg.get_reset();
      reg_blk.transfer_count_reg.reset();       //to reset the register
      des=reg_blk.transfer_count_reg.get();
      mir=reg_blk.transfer_count_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("TRANSFER_COUNT RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    $display("===========================================================================================");

       $display("FRONTDOOR write to DESCRP_ADDR register");
       reg_blk.descp_addr_reg.write(status,32'h1000_0000);
       des=reg_blk.descp_addr_reg.get();
       mir=reg_blk.descp_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
    
     $display("FRONTDOOR read from DESCRP_ADDR register");
      reg_blk.descp_addr_reg.read(status,rdata);
      des=reg_blk.descp_addr_reg.get();
      mir=reg_blk.descp_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
    reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
    
    $display("BACKDOOR write to DESCRP_ADDR register");
      reg_blk.descp_addr_reg.write(status,32'hFFFF_FFFF,UVM_BACKDOOR);
      des=reg_blk.descp_addr_reg.get();
      mir=reg_blk.descp_addr_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
    reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
    
      $display("BACKDOOR read from DESCRP_ADDR register");
      reg_blk.descp_addr_reg.read(status,rdata_bd,UVM_BACKDOOR);
      des=reg_blk.descp_addr_reg.get();
      mir=reg_blk.descp_addr_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
    reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
    if(status != UVM_IS_OK)
      `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
    else
      `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
    
      $display("RESET check on DESCRP_ADDR register");
      reset=reg_blk.descp_addr_reg.get_reset();
      reg_blk.descp_addr_reg.reset();       //to reset the register
      des=reg_blk.descp_addr_reg.get();
      mir=reg_blk.descp_addr_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE) 
    
  $display("===========================================================================================");
    
          $display("FRONTDOOR read from ERROR_STATUS register");
          reg_blk.error_status_reg.read(status,rdata);
          des=reg_blk.error_status_reg.get();
          mir=reg_blk.error_status_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("ERROR_STATUS READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
         reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(), $sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(), $sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
         $display("BACKDOOR poke(write) to ERROR_STATUS register");
         reg_blk.error_status_reg.poke(status,32'h001F_001F);
         des=reg_blk.error_status_reg.get();
         mir=reg_blk.error_status_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("ERROR_STATUS WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
         reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(), $sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(), $sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
         $display("FRONTDOOR read from ERROR_STATUS register");
          reg_blk.error_status_reg.read(status,rdata);
          des=reg_blk.error_status_reg.get();
          mir=reg_blk.error_status_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("ERROR_STATUS READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
         reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
     
         $display("FRONTDOOR write to ERROR_STATUS register");
         reg_blk.error_status_reg.write(status,32'h001F_001F);
         des=reg_blk.error_status_reg.get();
         mir=reg_blk.error_status_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("ERROR_STATUS WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
         reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(), $sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(), $sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
        $display("BACKDOOR read from ERROR_STATUS register");
        reg_blk.error_status_reg.read(status,rdata_bd,UVM_BACKDOOR);
        des=reg_blk.error_status_reg.get();
        mir=reg_blk.error_status_reg.get_mirrored_value();
        `uvm_info(get_full_name(),$sformatf("ERROR_STATUS READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
     
        reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
       $display("RESET check on ERROR_STATUS register");
       reset=reg_blk.error_status_reg.get_reset();
       reg_blk.error_status_reg.reset();       //to reset the register
       des=reg_blk.error_status_reg.get();
       mir=reg_blk.error_status_reg.get_mirrored_value();
       `uvm_info(get_full_name(),$sformatf("ERROR_STATUS RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE) 
    
    
  $display("===========================================================================================");

      $display("FRONTDOOR write to CONFIG_REG register");
       reg_blk.config_reg.write(status,32'h0000_01AF);
       des=reg_blk.config_reg.get();
       mir=reg_blk.config_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CONFIG_REG WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
       reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
     $display("FRONTDOOR read from CONFIG_REG register");
     reg_blk.config_reg.read(status,rdata);
      des=reg_blk.config_reg.get();
      mir=reg_blk.config_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CONFIG_REG READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
       reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
    $display("BACKDOOR write to CONFIG_REG register");
      reg_blk.config_reg.write(status,32'h0000_001F,UVM_BACKDOOR);
      des=reg_blk.config_reg.get();
      mir=reg_blk.config_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("CONFIG_REG WRITE VALUES VIA BACKDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
       reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
      $display("BACKDOOR read from CONFIG_REG register");
      reg_blk.config_reg.read(status,rdata_bd,UVM_BACKDOOR);
      des=reg_blk.config_reg.get();
      mir=reg_blk.config_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("CONFIG_REG READ VALUES VIA BACKDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata_bd),UVM_NONE)
    
       reg_blk.error_status_reg.mirror(status,UVM_CHECK);
         if(status != UVM_IS_OK)
         `uvm_error(get_type_name(),$sformatf("Mirror check failed for ERROR_STATUS register"))
         else
        `uvm_info(get_type_name(),$sformatf("Mirror check passed for ERROR_STATUS register"),UVM_MEDIUM)
    
      $display("RESET check on CONFIG_REG register");
      reset=reg_blk.config_reg.get_reset();
      reg_blk.config_reg.reset();       //to reset the register
      des=reg_blk.config_reg.get();
      mir=reg_blk.config_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("CONFIG_REG RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
  $display("===========================================================================================");
  endtask

endclass
