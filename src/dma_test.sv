class dma_test extends uvm_test;
  `uvm_component_utils(dma_test)
  dma_reg_sequence rseq;
  dma_environment env;
  
  function new(string name="dma_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       rseq=dma_reg_sequence::type_id::create("rseq");
       rseq.reg_blk=env.reg_blk;
       rseq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass
   
