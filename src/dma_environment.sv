class dma_environment extends uvm_env;
  `uvm_component_utils(dma_environment)
  dma_reg_block reg_blk;
  uvm_reg_predictor#(dma_sequence_item) predict_inst;
  dma_adapter adp_inst;
  dma_agent agt;
  dma_subscriber sub;
  
  function new(string name="dma_environment",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt=dma_agent::type_id::create("agt",this);
    sub=dma_subscriber::type_id::create("sub",this);
    predict_inst=uvm_reg_predictor#(dma_sequence_item)::type_id::create("predict_inst",this);
    adp_inst=dma_adapter::type_id::create("adp_inst");
    reg_blk=dma_reg_block::type_id::create("reg_blk",this);
    reg_blk.build();
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.mon_port.connect(sub.analysis_export);
    agt.mon.mon_port.connect(predict_inst.bus_in);
    predict_inst.adapter=adp_inst;
    predict_inst.map=reg_blk.default_map;
    reg_blk.default_map.set_sequencer(.sequencer(agt.seqr),.adapter(adp_inst));
    reg_blk.default_map.set_base_addr(0);
    reg_blk.default_map.set_auto_predict(0);
  endfunction
  
endclass
