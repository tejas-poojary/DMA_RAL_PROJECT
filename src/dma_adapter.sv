class dma_adapter extends uvm_reg_adapter;
  `uvm_object_utils(dma_adapter)
  
  function new(string name="dma_adapter");
    super.new(name);
  endfunction
  
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
   dma_sequence_item tr;
    tr=dma_sequence_item::type_id::create("tr");
    tr.wr_en=(rw.kind==UVM_WRITE)?1:0;
    tr.rd_en=(rw.kind==UVM_READ)?1:0;
    tr.addr=rw.addr;
    tr.wdata=rw.data;
    //`uvm_info("ADAPTER REG2BUS", $sformatf("reg2bus: kind=%s addr=%0h data=%0h",rw.kind.name(), rw.addr, rw.data), UVM_MEDIUM)
   return tr;
 endfunction
  
  function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
   dma_sequence_item tr;
    assert($cast(tr,bus_item));
    rw.kind=(tr.wr_en==1'b1)?UVM_WRITE:UVM_READ;
    rw.addr=tr.addr;
    if(rw.kind==UVM_WRITE)
      rw.data=tr.wdata; 
    else
      rw.data=tr.rdata;
    rw.status=UVM_IS_OK;
    //`uvm_info("ADAPTER BUS2REG", $sformatf("bus2reg: kind=%s addr=%0h data=%0h status=%s",rw.kind.name(), rw.addr, rw.data,rw.status.name()), UVM_LOW)
  endfunction
  
endclass
    
    
