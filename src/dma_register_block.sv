class dma_reg_block extends uvm_reg_block;
  `uvm_object_utils(dma_reg_block)
  rand INTR intr_reg;
  rand CTRL ctrl_reg;
  rand IO_ADDR io_addr_reg;
  rand MEM_ADDR mem_addr_reg;
  rand EXTRA_INFO extra_info_reg;
  rand STATUS status_reg;
  rand TRANSFER_COUNT transfer_count_reg;
  rand DESCRIPTOR_ADDR descp_addr_reg;
  rand ERROR_STATUS error_status_reg;
  rand CONFIG config_reg;
  
  function new(string name="dma_reg_block");
    super.new(name,build_coverage(UVM_NO_COVERAGE));
  endfunction
  
  function void build();
    add_hdl_path("DUT","RTL");
    uvm_reg::include_coverage("*",UVM_CVR_ALL);
    
    intr_reg=INTR::type_id::create("intr_reg");
    intr_reg.build();
    intr_reg.configure(this);
    intr_reg.add_hdl_path_slice("intr_status",0,16);
    intr_reg.add_hdl_path_slice("intr_mask",16,16);
    intr_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    ctrl_reg=CTRL::type_id::create("ctrl_reg");
    ctrl_reg.build();
    ctrl_reg.configure(this);
    ctrl_reg.add_hdl_path_slice("ctrl_start_dma",0,1);
    ctrl_reg.add_hdl_path_slice("ctrl_w_count",1,16);
    ctrl_reg.add_hdl_path_slice("ctrl_io_mem",16,1);
    ctrl_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    io_addr_reg=IO_ADDR::type_id::create("io_addr_reg");
    io_addr_reg.build();
    io_addr_reg.configure(this);
    io_addr_reg.add_hdl_path_slice("io_addr",0,32);
    io_addr_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    mem_addr_reg=MEM_ADDR::type_id::create("mem_addr_reg");
    mem_addr_reg.build();
    mem_addr_reg.configure(this);
    mem_addr_reg.add_hdl_path_slice("mem_addr",0,32);
    mem_addr_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    extra_info_reg=EXTRA_INFO::type_id::create("extra_info_reg");
    extra_info_reg.build();
    extra_info_reg.configure(this);
    extra_info_reg.add_hdl_path_slice("extra_info",0,32);
    extra_info_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    status_reg=STATUS::type_id::create("status_reg");
    status_reg.build();
    status_reg.configure(this);
    status_reg.add_hdl_path_slice("status_busy",0,1);
    status_reg.add_hdl_path_slice("status_done",1,1);
    status_reg.add_hdl_path_slice("status_error",2,1);
    status_reg.add_hdl_path_slice("status_paused",3,1);
    status_reg.add_hdl_path_slice("status_current_state",4,4);
    status_reg.add_hdl_path_slice("status_fifo_level",8,8);
    status_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    transfer_count_reg=TRANSFER_COUNT::type_id::create("transfer_count_reg");
    transfer_count_reg.build();
    transfer_count_reg.configure(this);
    transfer_count_reg.add_hdl_path_slice("transfer_count",0,32);
    transfer_count_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    descp_addr_reg=DESCRIPTOR_ADDR::type_id::create("descp_addr_reg");
    descp_addr_reg.build();
    descp_addr_reg.configure(this);
    descp_addr_reg.add_hdl_path_slice("descriptor_addr",0,32);
    descp_addr_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    error_status_reg=ERROR_STATUS::type_id::create("error_status_reg");
    error_status_reg.build();
    error_status_reg.configure(this);
    error_status_reg.add_hdl_path_slice("error_bus",0,1);
    error_status_reg.add_hdl_path_slice("error_timeout",1,1); error_status_reg.add_hdl_path_slice("error_alignment",2,1);
    error_status_reg.add_hdl_path_slice("error_overflow",3,1);
    error_status_reg.add_hdl_path_slice("error_underflow",4,1);
    error_status_reg.add_hdl_path_slice("error_code",8,8);
    error_status_reg.add_hdl_path_slice("error_addr_offset",16,16);
    error_status_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    config_reg=CONFIG::type_id::create("config_reg");
    config_reg.build();
    config_reg.configure(this);
    config_reg.add_hdl_path_slice("config_priority",0,2);
    config_reg.add_hdl_path_slice("config_auto_restart",2,1);
    config_reg.add_hdl_path_slice("config_interrupt_enable",3,1);
    config_reg.add_hdl_path_slice("config_burst_size",4,2);
    config_reg.add_hdl_path_slice("config_data_width",6,2);
    config_reg.add_hdl_path_slice("config_descriptor_mode",8,1);
    config_reg.set_coverage(UVM_CVR_FIELD_VALS);
    
    default_map=create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
    default_map.add_reg(intr_reg,'h400,"RW");
    default_map.add_reg(ctrl_reg,'h404,"RW");
    default_map.add_reg(io_addr_reg,'h408,"RW");
    default_map.add_reg(mem_addr_reg,'h40C,"RW");
    default_map.add_reg(extra_info_reg,'h410,"RW");
    default_map.add_reg(status_reg,'h414,"RO");
    default_map.add_reg(transfer_count_reg,'h418,"RO");
    default_map.add_reg(descp_addr_reg,'h41C,"RW");
    default_map.add_reg(error_status_reg,'h420,"RW");
    default_map.add_reg(config_reg,'h424,"RW");
    
    default_map.set_auto_predict(0);
    lock_model();
    
  endfunction
  
endclass
