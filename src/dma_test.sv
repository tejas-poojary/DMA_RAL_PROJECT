class intr_reg_test extends uvm_test;
  `uvm_component_utils(intr_reg_test)
  intr_reg_sequence seq;
  dma_environment env;
  
  function new(string name="intr_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=intr_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class ctrl_reg_test extends uvm_test;
  `uvm_component_utils(ctrl_reg_test)
  ctrl_reg_sequence seq;
  dma_environment env;
  
  function new(string name="ctrl_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=ctrl_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class io_addr_reg_test extends uvm_test;
  `uvm_component_utils(io_addr_reg_test)
  io_addr_reg_sequence seq;
  dma_environment env;
  
  function new(string name="io_addr_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=io_addr_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class mem_addr_reg_test extends uvm_test;
  `uvm_component_utils(mem_addr_reg_test)
  mem_addr_reg_sequence seq;
  dma_environment env;
  
  function new(string name="mem_addr_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=mem_addr_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class extra_info_reg_test extends uvm_test;
  `uvm_component_utils(extra_info_reg_test)
  extra_info_reg_sequence seq;
  dma_environment env;
  
  function new(string name="extra_info_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=extra_info_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class status_reg_test extends uvm_test;
  `uvm_component_utils(status_reg_test)
  status_reg_sequence seq;
  dma_environment env;
  
  function new(string name="status_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq= status_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class transfer_count_reg_test extends uvm_test;
  `uvm_component_utils(transfer_count_reg_test)
  transfer_count_reg_sequence seq;
  dma_environment env;
  
  function new(string name="transfer_count_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=transfer_count_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class descp_addr_reg_test extends uvm_test;
  `uvm_component_utils(descp_addr_reg_test)
  descp_addr_reg_sequence seq;
  dma_environment env;
  
  function new(string name="descp_addr_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=descp_addr_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class error_status_reg_test extends uvm_test;
  `uvm_component_utils(error_status_reg_test)
  error_status_reg_sequence seq;
  dma_environment env;
  
  function new(string name="error_status_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=error_status_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
endclass

class config_reg_test extends uvm_test;
  `uvm_component_utils(config_reg_test)
  config_reg_sequence seq;
  dma_environment env;
  
  function new(string name="config_reg_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=config_reg_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass

class regression_test extends uvm_test;
  `uvm_component_utils(regression_test)
  regression_sequence seq;
  dma_environment env;
  
  function new(string name="regression_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dma_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"*","is_active",UVM_ACTIVE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
       seq=regression_sequence::type_id::create("seq");
       seq.reg_blk=env.reg_blk;
       seq.start(env.agt.seqr);
      phase.drop_objection(this);
  endtask
  
endclass
