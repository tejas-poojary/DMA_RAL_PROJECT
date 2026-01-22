class dma_driver extends uvm_driver#(dma_sequence_item);
  `uvm_component_utils(dma_driver)
  dma_sequence_item req;
  virtual dma_intrf vif_drv;
  
  function new(string name="dma_driver",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dma_intrf)::get(this,"","vif",vif_drv))
      `uvm_fatal(get_full_name(),"Driver didnt get interface")
  endfunction
  
  task drive_dut(dma_sequence_item req);
    $display("Driver driving at %0t |wr_en=%0d | rd_en=%0d  | addr=%0h  | wdata=%0h",$time,req.wr_en,req.rd_en,req.addr,req.wdata);
    vif_drv.drv_cb.wr_en <= req.wr_en;
    vif_drv.drv_cb.rd_en <= req.rd_en;
    vif_drv.drv_cb.addr  <= req.addr;
    if(req.wr_en)
     vif_drv.drv_cb.wdata <= req.wdata;
    repeat(1)@(vif_drv.drv_cb);
    if(req.rd_en)
      req.rdata=vif_drv.rdata;
    repeat(2)@(vif_drv.drv_cb);    
  endtask
    
  virtual task run_phase(uvm_phase phase);
    repeat(2)@(vif_drv.drv_cb); 
    forever begin
      req=dma_sequence_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      drive_dut(req);
      seq_item_port.item_done();
    end
  endtask
  
endclass
  
