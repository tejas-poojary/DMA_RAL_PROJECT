class intr_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(intr_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="intr_reg_sequence");
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
      
      //Random values write and read
      repeat(10)
        begin
          $display("FRONTDOOR random value write to interrupt register");
          reg_blk.intr_reg.write(status,$random,UVM_FRONTDOOR); 
          des=reg_blk.intr_reg.get();
          mir=reg_blk.intr_reg.get_mirrored_value();
           `uvm_info(get_full_name(),$sformatf("INTR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
          reg_blk.intr_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM)
    
           $display("FRONTDOOR random value read from interrupt register");
           reg_blk.intr_reg.read(status,rdata);
           des=reg_blk.intr_reg.get();
           mir=reg_blk.intr_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("INTR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
           reg_blk.intr_reg.mirror(status, UVM_CHECK);
           if(status != UVM_IS_OK)
           `uvm_error(get_type_name(), $sformatf("Mirror check failed for INTR register"))
           else
           `uvm_info(get_type_name(), $sformatf("Mirror check passed for INTR register"),UVM_MEDIUM) 
         end
    
    $display("RESET check on interrupt register");
    reset=reg_blk.intr_reg.get_reset();
    reg_blk.intr_reg.reset();     //to reset the register
    des=reg_blk.intr_reg.get();
    mir=reg_blk.intr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("INTR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)

endtask

endclass
    

class ctrl_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(ctrl_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="ctrl_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

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
     
     //Random values write and read
     repeat(10)
        begin
          $display("FRONTDOOR random value write to control register");
          reg_blk.ctrl_reg.write(status,$random,UVM_FRONTDOOR);
          des=reg_blk.ctrl_reg.get();
          mir=reg_blk.ctrl_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("CTRL WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
          reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
         else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
    
           $display("FRONTDOOR random value read from control register");
          reg_blk.ctrl_reg.read(status,rdata);
          des=reg_blk.ctrl_reg.get();
          mir=reg_blk.ctrl_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("CTRL READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
          reg_blk.ctrl_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for CTRL register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for CTRL register"),UVM_MEDIUM)
        end
    
    $display("RESET check on control register");
    reset=reg_blk.ctrl_reg.get_reset();
    reg_blk.ctrl_reg.reset();  //to reset the register
    des=reg_blk.ctrl_reg.get();
    mir=reg_blk.ctrl_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("CTRL RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
   
endtask

endclass

class io_addr_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(io_addr_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="io_addr_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

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
     
      //Random values write and read
      repeat(10)
        begin
          $display("FRONTDOOR random value write to IO_ADDR register");
           reg_blk.io_addr_reg.write(status,$random,UVM_FRONTDOOR);
           des=reg_blk.io_addr_reg.get();
           mir=reg_blk.io_addr_reg.get_mirrored_value();
           `uvm_info(get_full_name(),$sformatf("IO_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
           reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
           if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
           else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
    
             $display("FRONTDOOR randon value read from IO_ADDR register");
          reg_blk.io_addr_reg.read(status,rdata);
          des=reg_blk.io_addr_reg.get();
          mir=reg_blk.io_addr_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("IO_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
          reg_blk.io_addr_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for IO_ADDR register"))
         else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for IO_ADDR register"),UVM_MEDIUM)
     
       end
    
    $display("RESET check on IO_ADDR register");
    reset=reg_blk.io_addr_reg.get_reset();
    reg_blk.io_addr_reg.reset();    //to reset the register
    des=reg_blk.io_addr_reg.get();
    mir=reg_blk.io_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("IO_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)

endtask

endclass


class mem_addr_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(mem_addr_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="mem_addr_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

    
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
      
     //Random values write and read
      repeat(10)
        begin
          $display("FRONTDOOR random value write to MEM_ADDR register");
          reg_blk.mem_addr_reg.write(status,$random,UVM_FRONTDOOR);
          des=reg_blk.mem_addr_reg.get();
          mir=reg_blk.mem_addr_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("MEM_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
          reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
    
            $display("FRONTDOOR random value read from MEM_ADDR register");
          reg_blk.mem_addr_reg.read(status,rdata);
          des=reg_blk.mem_addr_reg.get();
          mir=reg_blk.mem_addr_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("MEM_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
          reg_blk.mem_addr_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
           `uvm_error(get_type_name(), $sformatf("Mirror check failed for MEM_ADDR register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for MEM_ADDR register"),UVM_MEDIUM)
     
       end
    
    $display("RESET check on MEM_ADDR register");
    reset=reg_blk.mem_addr_reg.get_reset();
    reg_blk.mem_addr_reg.reset();      //to reset the register
    des=reg_blk.mem_addr_reg.get();
    mir=reg_blk.mem_addr_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("MEM_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)  

endtask

endclass

class extra_info_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(extra_info_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="extra_info_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

    
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
      
      //Random values write and read
      repeat(10)
        begin
          $display("FRONTDOOR random value write to EXTRA_INFO register");
          reg_blk.extra_info_reg.write(status,$random,UVM_FRONTDOOR);
          des=reg_blk.extra_info_reg.get();
          mir=reg_blk.extra_info_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("EXTRA_INFO WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
          reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)
    
            $display("FRONTDOOR random value read from EXTRA_INFO register");
          reg_blk.extra_info_reg.read(status,rdata);
          des=reg_blk.extra_info_reg.get();
          mir=reg_blk.extra_info_reg.get_mirrored_value();
         `uvm_info(get_full_name(),$sformatf("EXTRA_INFO READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
          reg_blk.extra_info_reg.mirror(status, UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for EXTRA_INFO register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for EXTRA_INFO register"),UVM_MEDIUM)  
       end
    
     $display("RESET check on EXTRA_INFO register");
     reset=reg_blk.extra_info_reg.get_reset();
     reg_blk.extra_info_reg.reset();       //to reset the register
     des=reg_blk.extra_info_reg.get();
     mir=reg_blk.extra_info_reg.get_mirrored_value();
    `uvm_info(get_full_name(),$sformatf("EXTRA_INFO RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE) 

endtask

endclass

class status_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(status_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="status_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

    
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

endtask

endclass

class transfer_count_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(transfer_count_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="transfer_count_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

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

endtask

endclass


class descp_addr_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(descp_addr_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="descp_addr_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

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
      
       //Random values write and read
      repeat(10)
        begin
          $display("FRONTDOOR random value write to DESCRP_ADDR register");
          reg_blk.descp_addr_reg.write(status,$random,UVM_FRONTDOOR);
          des=reg_blk.descp_addr_reg.get();
          mir=reg_blk.descp_addr_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR WRITE VALUES VIA FRONTDOOR Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
          reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
    
            $display("FRONTDOOR random value read from DESCRP_ADDR register");
          reg_blk.descp_addr_reg.read(status,rdata);
          des=reg_blk.descp_addr_reg.get();
          mir=reg_blk.descp_addr_reg.get_mirrored_value();
          `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR READ VALUES VIA FRONTDOOR Des=%0h |Mir=%0h | Rdata=%0h",des,mir,rdata),UVM_NONE)
    
          reg_blk.descp_addr_reg.mirror(status,UVM_CHECK);
          if(status != UVM_IS_OK)
          `uvm_error(get_type_name(), $sformatf("Mirror check failed for DESCRP_ADDR register"))
          else
          `uvm_info(get_type_name(), $sformatf("Mirror check passed for DESCRP_ADDR register"),UVM_MEDIUM)
       end
    
      $display("RESET check on DESCRP_ADDR register");
      reset=reg_blk.descp_addr_reg.get_reset();
      reg_blk.descp_addr_reg.reset();       //to reset the register
      des=reg_blk.descp_addr_reg.get();
      mir=reg_blk.descp_addr_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("DESCRP_ADDR RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE) 

endtask

endclass

class error_status_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(error_status_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="error_status_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")

    
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
           
           repeat(10)
              begin
               $display("BACKDOOR poke(write) to ERROR_STATUS register");
                reg_blk.error_status_reg.poke(status,$random);
               des=reg_blk.error_status_reg.get();
               mir=reg_blk.error_status_reg.get_mirrored_value();
                `uvm_info(get_full_name(),$sformatf("ERROR_STATUS WRITE VALUES VIA POKE Des=%0h |Mir=%0h",des,mir),UVM_NONE)

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
           end

             $display("RESET check on ERROR_STATUS register");
             reset=reg_blk.error_status_reg.get_reset();
             reg_blk.error_status_reg.reset();       //to reset the register
             des=reg_blk.error_status_reg.get();
             mir=reg_blk.error_status_reg.get_mirrored_value();
             `uvm_info(get_full_name(),$sformatf("ERROR_STATUS RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
  endtask
  
endclass


class config_reg_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(config_reg_sequence)
  dma_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata;
  uvm_reg_data_t rdata_bd;
  uvm_reg_data_t des;
  uvm_reg_data_t mir;
  uvm_reg_data_t reset;
  
  function new(string name="config_reg_sequence");
    super.new(name);
  endfunction
  
  task body();
    if(reg_blk==null)
      `uvm_fatal(get_full_name(),"Register Sequence not created")
 
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
           
       //Random values write and read
      repeat(10)
        begin
         $display("FRONTDOOR write to CONFIG_REG register");
         reg_blk.config_reg.write(status,$random,UVM_FRONTDOOR);
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
    
       end
    
      $display("RESET check on CONFIG_REG register");
      reset=reg_blk.config_reg.get_reset();
      reg_blk.config_reg.reset();       //to reset the register
      des=reg_blk.config_reg.get();
      mir=reg_blk.config_reg.get_mirrored_value();
      `uvm_info(get_full_name(),$sformatf("CONFIG_REG RESET values Des=%0h |Mir=%0h",des,mir),UVM_NONE)
    
      $display("===========================================================================================");
  endtask

endclass

class regression_sequence extends uvm_sequence#(dma_sequence_item);
  `uvm_object_utils(regression_sequence)
  dma_reg_block reg_blk;
  intr_reg_sequence seq1;
  ctrl_reg_sequence seq2;
  io_addr_reg_sequence seq3;
  mem_addr_reg_sequence seq4;
  extra_info_reg_sequence seq5;
  status_reg_sequence seq6;
  transfer_count_reg_sequence seq7;
  descp_addr_reg_sequence seq8;
  error_status_reg_sequence seq9;
  config_reg_sequence seq10;
  
  function new(string name="regression_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    seq1=intr_reg_sequence::type_id::create("seq1");
    seq2=ctrl_reg_sequence::type_id::create("seq2");
    seq3=io_addr_reg_sequence::type_id::create("seq3");
    seq4=mem_addr_reg_sequence::type_id::create("seq4");
    seq5=extra_info_reg_sequence::type_id::create("seq5");
    seq6=status_reg_sequence::type_id::create("seq6");
    seq7=transfer_count_reg_sequence::type_id::create("seq7");
    seq8=descp_addr_reg_sequence::type_id::create("seq8");
    seq9=error_status_reg_sequence::type_id::create("seq9");
    seq10=config_reg_sequence::type_id::create("seq10");
    
    seq1.reg_blk=reg_blk;
    seq2.reg_blk=reg_blk;
    seq3.reg_blk=reg_blk;
    seq4.reg_blk=reg_blk;
    seq5.reg_blk=reg_blk;
    seq6.reg_blk=reg_blk;
    seq7.reg_blk=reg_blk;
    seq8.reg_blk=reg_blk;
    seq9.reg_blk=reg_blk;
    seq10.reg_blk=reg_blk;
    
    `uvm_info(get_type_name(),"Starting INTR_REG_SEQUENCE", UVM_LOW)
    seq1.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting CTRL_REG_SEQUENCE", UVM_LOW)
    seq2.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting IO_ADDR_REG_SEQUENCE", UVM_LOW)
    seq3.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting MEM_ADDR_REG_SEQUENCE", UVM_LOW)
    seq4.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting EXTRA_INFO_REG_SEQUENCE", UVM_LOW)
    seq5.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting STATUS_REG_SEQUENCE", UVM_LOW)
    seq6.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting TRANSFER_COUNT_REG_SEQUENCE", UVM_LOW)
    seq7.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting DESCP_ADDR_REG_SEQUENCE", UVM_LOW)
    seq8.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting ERROR_STATUS_REG_SEQUENCE", UVM_LOW)
    seq9.start(m_sequencer);
    `uvm_info(get_type_name(),"Starting CONFIG_REG_SEQUENCE", UVM_LOW)
    seq10.start(m_sequencer);
    
  endtask
  
endclass
  
  
