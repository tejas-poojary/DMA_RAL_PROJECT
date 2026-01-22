class dma_monitor extends uvm_monitor;
  `uvm_component_utils(dma_monitor)
  virtual dma_intrf vif_mon;
  dma_sequence_item req;
  uvm_analysis_port#(dma_sequence_item)mon_port;
  
  function new(string name="dma_monitor",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_port=new("mon_port",this);
    if(!uvm_config_db#(virtual dma_intrf)::get(this,"","vif",vif_mon))
      `uvm_fatal(get_full_name(),"Monitor didnt get interface")
  endfunction
      
   virtual task run_phase(uvm_phase phase);
    repeat(3)@(vif_mon.mon_cb);
    forever begin
     req=dma_sequence_item::type_id::create("req");
     req.wr_en=vif_mon.mon_cb.wr_en;
     req.rd_en=vif_mon.mon_cb.rd_en;
     req.wdata=vif_mon.mon_cb.wdata;
     req.addr=vif_mon.mon_cb.addr;
     req.rdata=vif_mon.mon_cb.rdata;
      $display("Monitor capturing at %0t |wr_en=%0d | rd_en=%0d  | addr=%0h  | wdata=%0h | rdata=%0h",$time,req.wr_en,req.rd_en,req.addr,req.wdata,req.rdata);
     mon_port.write(req);
      repeat(3)@(vif_mon.mon_cb);
    end
   endtask
 endclass
