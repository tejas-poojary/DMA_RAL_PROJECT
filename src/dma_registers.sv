class INTR extends uvm_reg;
 `uvm_object_utils(INTR)
  uvm_reg_field intr_status;    //read only access
  rand uvm_reg_field intr_mask;
  
  covergroup intr_cov;
   option.per_instance=1;
   coverpoint intr_status.value;
   coverpoint intr_mask.value;
  endgroup
  
  function new(string name="INTR");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      intr_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    intr_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    intr_cov.sample();
  endfunction
  
  function void build();
    intr_status=uvm_reg_field::type_id::create("intr_status");
    intr_status.configure(.parent(this),
                          .size(16),
                          .lsb_pos(0),
                          .access("RO"),
                          .volatile(0),
                          .reset(0),
                          .has_reset(1),
                          .is_rand(0),
                          .individually_accessible(1)
                         );
    intr_mask=uvm_reg_field::type_id::create("intr_mask");
    intr_mask.configure(.parent(this),
                          .size(16),
                          .lsb_pos(16),
                        .access("RW"),
                        .volatile(0),
                        .reset(0),
                        .has_reset(1),
                        .is_rand(1),
                          .individually_accessible(1)
                       );
  endfunction
  
endclass

class CTRL extends uvm_reg;
  `uvm_object_utils(CTRL)
  rand uvm_reg_field start_dma;
  rand uvm_reg_field w_count;
  rand uvm_reg_field io_mem;
  uvm_reg_field Reserved;
  
  covergroup ctrl_cov;
   option.per_instance=1;
   coverpoint start_dma.value;
   coverpoint w_count.value;
   coverpoint io_mem.value;
   coverpoint Reserved.value; 
  endgroup
  
  function new(string name="CTRL");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      ctrl_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    ctrl_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    ctrl_cov.sample();
  endfunction
  
  function void build();
    start_dma=uvm_reg_field::type_id::create("start_dma");
    start_dma.configure(.parent(this),
                          .size(1),
                          .lsb_pos(0),
                        .access("RW"),
                        .volatile(0),
                        .reset(0),
                        .has_reset(1),
                        .is_rand(1),
                        .individually_accessible(1)
                         );
    w_count=uvm_reg_field::type_id::create("w_count");
    w_count.configure(.parent(this),
                      .size(15),
                      .lsb_pos(1),
                      .access("RW"),
                      .volatile(0),
                      .reset(0),
                      .has_reset(1),
                      .is_rand(1),
                       .individually_accessible(1)
                       );
    io_mem=uvm_reg_field::type_id::create("io_mem");
    io_mem.configure(.parent(this),
                      .size(1),
                     .lsb_pos(16),
                     .access("RW"),
                     .volatile(0),
                     .reset(0),
                     .has_reset(1),
                     .is_rand(1),
                       .individually_accessible(1)
                       );
    Reserved=uvm_reg_field::type_id::create("Reserved");
    Reserved.configure(.parent(this),
                      .size(15),
                      .lsb_pos(17),
                       .access("RO"),
                       .volatile(0),
                       .reset(0),
                       .has_reset(1),
                       .is_rand(0),
                      .individually_accessible(1)
                       );
  endfunction
  
endclass

class IO_ADDR extends uvm_reg;
  `uvm_object_utils(IO_ADDR)
  rand uvm_reg_field io_addr;
  
  covergroup io_addr_cov;
   option.per_instance=1;
    coverpoint io_addr.value; 
  endgroup
  
  function new(string name="IO_ADDR");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      io_addr_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    io_addr_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    io_addr_cov.sample();
  endfunction
  
  function void build();
    io_addr=uvm_reg_field::type_id::create("io_addr");
    io_addr.configure(.parent(this),
                      .size(32),
                       .lsb_pos(0),
                      .access("RW"),
                      .volatile(0),
                      .reset(0),
                      .has_reset(1),
                      .is_rand(1),
                        .individually_accessible(1)
                         );
  endfunction
  
endclass

class MEM_ADDR extends uvm_reg;
  `uvm_object_utils(MEM_ADDR)
   rand uvm_reg_field mem_addr;
  
  covergroup mem_addr_cov;
   option.per_instance=1;
   coverpoint mem_addr.value; 
  endgroup

  function new(string name="MEM_ADDR");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      mem_addr_cov=new();
  endfunction
  
   virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    mem_addr_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    mem_addr_cov.sample();
  endfunction

  function void build();
    mem_addr = uvm_reg_field::type_id::create("mem_addr");
    mem_addr.configure(
      .parent(this),
      .size(32),
      .lsb_pos(0),
      .access("RW"),
      .volatile(0),
      .reset('h0),
      .has_reset(1),
      .is_rand(1),
      .individually_accessible(1)
    );
  endfunction
  
endclass

class EXTRA_INFO extends uvm_reg;
  `uvm_object_utils(EXTRA_INFO)
  rand uvm_reg_field extra_info;
  
  covergroup extra_cov;
   option.per_instance=1;
    coverpoint extra_info.value; 
  endgroup

  function new(string name="EXTRA_INFO");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      extra_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    extra_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    extra_cov.sample();
  endfunction
  

  function void build();
    extra_info = uvm_reg_field::type_id::create("extra_info");
    extra_info.configure(
      .parent(this),
      .size(32),
      .lsb_pos(0),
      .access("RW"),
      .volatile(0),
      .reset('h0),
      .has_reset(1),
      .is_rand(1),
      .individually_accessible(1)
    );
  endfunction
  
endclass

class STATUS extends uvm_reg;
  `uvm_object_utils(STATUS)
  uvm_reg_field busy;
  uvm_reg_field done;
  uvm_reg_field error;
  uvm_reg_field paused;
  uvm_reg_field current_state;
  uvm_reg_field fifo_level;
  uvm_reg_field reserved;
  
   covergroup status_cov;
   option.per_instance=1;
    coverpoint busy.value; 
    coverpoint done.value;
    coverpoint error.value;
    coverpoint paused.value;
    coverpoint current_state.value;
    coverpoint fifo_level.value;
    coverpoint reserved.value;
  endgroup

  function new(string name="STATUS");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      status_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    status_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    status_cov.sample();
  endfunction

  function void build();
    busy = uvm_reg_field::type_id::create("busy");
    busy.configure(this, 1, 0, "RO", 0, 0, 1, 0,1);

    done = uvm_reg_field::type_id::create("done");
    done.configure(this, 1, 1, "RO", 0, 0, 1, 0,1);

    error = uvm_reg_field::type_id::create("error");
    error.configure(this, 1, 2, "RO", 0, 0, 1, 0,1);

    paused = uvm_reg_field::type_id::create("paused");
    paused.configure(this, 1, 3, "RO", 0, 0, 1, 0,1);

    current_state = uvm_reg_field::type_id::create("current_state");
    current_state.configure(this, 4, 4, "RO", 0, 0, 1, 0,1);

    fifo_level = uvm_reg_field::type_id::create("fifo_level");
    fifo_level.configure(this, 8, 8, "RO", 0, 0, 1, 0,1);

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 16, 16, "RO", 0, 0, 1, 0,1);
  endfunction
  
endclass

class TRANSFER_COUNT extends uvm_reg;
  `uvm_object_utils(TRANSFER_COUNT)

  uvm_reg_field transfer_count;
  
  covergroup transfer_count_cov;
    option.per_instance=1;
    coverpoint transfer_count.value;
  endgroup

  function new(string name="TRANSFER_COUNT");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      transfer_count_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    transfer_count_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    transfer_count_cov.sample();
  endfunction

  function void build();
    transfer_count = uvm_reg_field::type_id::create("transfer_count");
    transfer_count.configure(
      .parent(this),
      .size(32),
      .lsb_pos(0),
      .access("RO"),
      .volatile(0),
      .reset('h0),
      .has_reset(1),
      .is_rand(0),
      .individually_accessible(1)
    );
  endfunction
  
endclass

class DESCRIPTOR_ADDR extends uvm_reg;
  `uvm_object_utils(DESCRIPTOR_ADDR)

  rand uvm_reg_field descriptor_addr;
  
  covergroup descriptor_cov;
    option.per_instance=1;
    coverpoint descriptor_addr.value;
  endgroup

  function new(string name="DESCRIPTOR_ADDR");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      descriptor_cov=new();
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    descriptor_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    descriptor_cov.sample();
  endfunction

  function void build();
    descriptor_addr = uvm_reg_field::type_id::create("descriptor_addr");
    descriptor_addr.configure(
      .parent(this),
      .size(32),
      .lsb_pos(0),
      .access("RW"),
      .volatile(0),
      .reset('h0),
      .has_reset(1),
      .is_rand(1),
      .individually_accessible(1)
    );
  endfunction
  
endclass

class ERROR_STATUS extends uvm_reg;
  `uvm_object_utils(ERROR_STATUS)

  uvm_reg_field bus_error;
  uvm_reg_field timeout_error;
  uvm_reg_field alignment_error;
  uvm_reg_field overflow_error;
  uvm_reg_field underflow_error;
  uvm_reg_field reserved_7_5;
  uvm_reg_field error_code;
  uvm_reg_field error_addr_offset;
  
  covergroup error_status_cov;
    option.per_instance = 1;
    coverpoint bus_error.value;
    coverpoint timeout_error.value;
    coverpoint alignment_error.value;
    coverpoint overflow_error.value;
    coverpoint underflow_error.value;
    coverpoint reserved_7_5.value;
    coverpoint error_code.value;
    coverpoint error_addr_offset.value;
  endgroup

  function new(string name="ERROR_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      error_status_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    error_status_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    error_status_cov.sample();
  endfunction

  function void build();

    bus_error = uvm_reg_field::type_id::create("bus_error");
    bus_error.configure(this, 1, 0, "W1C", 0, 'h0, 1, 1,1);

    timeout_error = uvm_reg_field::type_id::create("timeout_error");
    timeout_error.configure(this, 1, 1, "W1C", 0, 'h0, 1, 1,1);

    alignment_error = uvm_reg_field::type_id::create("alignment_error");
    alignment_error.configure(this, 1, 2, "W1C", 0, 'h0, 1, 1,1);

    overflow_error = uvm_reg_field::type_id::create("overflow_error");
    overflow_error.configure(this, 1, 3, "W1C", 0, 'h0, 1,1,1);

    underflow_error = uvm_reg_field::type_id::create("underflow_error");
    underflow_error.configure(this, 1, 4, "W1C", 0, 'h0, 1, 1,1);

    reserved_7_5 = uvm_reg_field::type_id::create("reserved_7_5");
    reserved_7_5.configure(this, 3, 5, "RO", 0, 'h0, 1,1,1);

    error_code = uvm_reg_field::type_id::create("error_code");
    error_code.configure(this, 8, 8, "RO", 0, 'h0, 1,1,1);

    error_addr_offset = uvm_reg_field::type_id::create("error_addr_offset");
    error_addr_offset.configure(this, 16, 16, "RO", 0, 'h0, 1,1,1);

  endfunction
  
endclass

class CONFIG extends uvm_reg;
  `uvm_object_utils(CONFIG)

  rand uvm_reg_field priority_field;
  rand uvm_reg_field auto_restart;
  rand uvm_reg_field interrupt_enable;
  rand uvm_reg_field burst_size;
  rand uvm_reg_field data_width;
  rand uvm_reg_field descriptor_mode;
  uvm_reg_field reserved_31_9;
  
  covergroup config_cov;
   option.per_instance = 1;
    coverpoint priority_field.value;
    coverpoint auto_restart.value;
    coverpoint interrupt_enable.value;
    coverpoint burst_size.value;
    coverpoint data_width.value;
    coverpoint descriptor_mode.value;
  endgroup

   function new(string name="ERROR_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      config_cov=new();
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    config_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    config_cov.sample();
  endfunction

  function void build();
    priority_field = uvm_reg_field::type_id::create("priority");
    priority_field.configure(this, 2, 0, "RW", 0, 'h0, 1, 1,1);

    auto_restart = uvm_reg_field::type_id::create("auto_restart");
    auto_restart.configure(this, 1, 2, "RW", 0, 'h0, 1, 1,1);

    interrupt_enable = uvm_reg_field::type_id::create("interrupt_enable");
    interrupt_enable.configure(this, 1, 3, "RW", 0, 'h0, 1, 1,1);

    burst_size = uvm_reg_field::type_id::create("burst_size");
    burst_size.configure(this, 2, 4, "RW", 0, 'h0, 1, 1,1);

    data_width = uvm_reg_field::type_id::create("data_width");
    data_width.configure(this, 2, 6, "RW", 0, 'h0, 1, 1,1);

    descriptor_mode = uvm_reg_field::type_id::create("descriptor_mode");
    descriptor_mode.configure(this, 1, 8, "RW", 0, 'h0, 1, 1,1);

    reserved_31_9 = uvm_reg_field::type_id::create("reserved_31_9");
    reserved_31_9.configure(this, 23, 9, "RO", 0, 'h0, 1, 1,1);

  endfunction
endclass







