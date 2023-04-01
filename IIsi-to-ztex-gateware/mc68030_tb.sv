`timescale 1 ns / 1 ps

module mc68030_tb ();

   parameter TEST_CARD_ID    = 'hc;
   parameter TEST_ADDR = 'hf9000000;
   parameter TEST_DATA = 'h87654321;
   parameter ROM_ADDR =  'hF9FFF000;
   
   // Clock (rising is driving edge, faling is sampling) 
   tri1                bd_clk48; 
   
   // Clock 
   tri1                pds_cpuclk; 
   // Reset
   tri1                pds_resetn; 
   // Address
   tri1 [31:0]         pds_A;
   // Data
   tri1 [31:0]         pds_D;
   // ACKs
   tri1 [1:0] 	       pds_dsack;
   tri1 	       pds_stermn;
   // irq
   tri1 	       pds_irq1;
   // support
   tri1 	       pds_rwn;
   tri1 	       pds_dsn;
   tri1 	       pds_asn;
   tri1 	       pds_berrn;
   tri1 	       pds_haltn;
   tri1 [1:0] 	       pds_siz;
   tri1 [2:0] 	       pds_fc;
   tri1 [1:0] 	       leds;

   ztex213_pds_V1_0 UPDS (
			  .clk48(bd_clk48),
			  .cpuclk_3v3_n(pds_cpuclk),
			  .reset_3v3_n(pds_resetn),
			  .user_led0(leds[0]),
			  .user_led1(leds[1]),
			  .irq1_3v3_n(pds_irq1),
			  .A_3v3(pds_A),
			  .D_3v3(pds_D),
			  .rw_3v3_n(pds_rwn),
			  .ds_3v3_n(pds_dsn),
			  .as_3v3_n(pds_asn),
			  .berr_3v3_n(pds_berrn),
			  .halt_3v3_n(pds_haltn),
			  .siz_3v3(pds_siz),
			  .fc_3v3(pds_fc),
			  .dsack_3v3_n(pds_dsack),
			  .sterm_3v3_n(pds_stermn)
);

   // State machine of test bench
   reg 		       tst_cpuclk;
   reg 		       tst_clk48;
   reg 		       tst_resetn;
   reg [31:0] 	       tst_A;
   reg [31:0] 	       tst_D;
   reg 		       tst_stermn;
   reg 		       tst_irq1;
   reg 		       tst_rwn;
   reg 		       tst_dsn;
   reg 		       tst_asn;
   reg 		       tst_berrn;
   reg 		       tst_haltn;
   reg [1:0] 	       tst_siz;
   reg [2:0] 	       tst_fc;
   reg [1:0] 	       tst_dsack;

   reg 	       tst_procwrite;
   reg 	       tst_procread;
   
   
   assign pds_cpuclk   = tst_cpuclk;
   assign bd_clk48     = tst_clk48;
   assign pds_resetn   = tst_resetn;
   assign pds_A        = (tst_procwrite | tst_procread) ? tst_A : 'bZ;
   assign pds_D        = (tst_procwrite) ? tst_D : 'bZ;
   assign pds_rwn      = (tst_procwrite | tst_procread) ? tst_rwn : 'bZ;
   assign pds_dsn      = (tst_procwrite | tst_procread) ? tst_dsn : 'bZ;
   assign pds_asn      = (tst_procwrite | tst_procread) ? tst_asn : 'bZ;
   assign pds_siz      = (tst_procwrite | tst_procread) ? tst_siz : 'bZ;
   assign pds_fc       = (tst_procwrite | tst_procread) ? tst_fc : 'bZ;
   assign tst_stermn   = pds_stermn;
   assign tst_dsack    = pds_dsack;
   
    
   initial begin
      $display ("Start virtual master (vm) writes and reads to/from PDS slave memory module");
      $dumpfile("mc68030_tb.vcd");
      $dumpvars;
      #1;
      tst_procwrite <= 0;
      tst_procread <= 0;
      tst_resetn <= 0;
      tst_A <= 'hFFFFFFFF;
      tst_D <= 'hFFFFFFFF;
      tst_rwn <= 1;
      tst_dsn <= 1;
      tst_asn <= 1;
      tst_siz <= 0;
      tst_fc <= 0;
      #100;      
      tst_resetn <= 1;

      #2000;  // wait for sysclk to have started, and sysreset to have enabled everything
        tst_resetn <= 1;
      @ (posedge pds_cpuclk);
      @ (posedge pds_cpuclk);
      @ (posedge pds_cpuclk);

      write_word_sync(TEST_ADDR+0, TEST_DATA);
      @ (posedge pds_cpuclk);
      @ (posedge pds_cpuclk);
      read_word_sync(TEST_ADDR+0);
      
      
      @ (posedge pds_cpuclk);
      @ (posedge pds_cpuclk);

      $finish;
   end


   // ======================================================
   // Write tasks
   // ======================================================

   task write_word_sync;
      input [31:0] addr;
      input [31:0] data;
      begin
	 @(posedge pds_cpuclk);
	 #3;
	 tst_procwrite <= 1;
	 tst_A <= addr;
	 #0.01;	 
	 tst_fc <= 0;
	 #0.01;	 
	 tst_siz <= 0; // 32 bits
	 #0.01;	 
	 tst_rwn <= 0; //write
	 #0.01;	 
	 tst_asn <= 0;
	 #0.01;
	 tst_D <= data;
	 #0.01;	 
	 tst_dsn <= 0;
	 #0.01;	 
	 
	 @(negedge pds_stermn);
	 // @(posedge pds_cpuclk);
	 #0.01;
	 tst_asn <= 1;
	 #0.01;
	 tst_dsn <= 1;
	 #0.01;
	 tst_D <= 0;
	 #0.01;
	 tst_procwrite <= 0;
      end
   endtask // write_word_sync
   
   // ======================================================
   // Read tasks
   // ======================================================
   
   task read_word_sync;
      input [31:0] addr;
      begin
	 @(posedge pds_cpuclk);
	 #3;
	 tst_procread <= 1;
	 tst_A <= addr;
	 #0.01;	 
	 tst_fc <= 0;
	 #0.01;	 
	 tst_siz <= 0; // 32 bits
	 #0.01;	 
	 tst_rwn <= 1; //read
	 #0.01;	 
	 tst_asn <= 0;
	 #0.01;	 
	 tst_dsn <= 0;
	 #0.01;	 
	 
	 @(negedge pds_stermn);
	 // @(posedge pds_cpuclk);
	 #0.01;
	 tst_asn <= 1;
	 #0.01;
	 tst_dsn <= 1;
	 #0.01;
         $display ("%g  (read ) address: $%h data: $%h", $time, addr, pds_D);
	 #0.01;
	 tst_procread <= 0;
      end
   endtask // read_word_sync
   
   // ======================================================
   // Clock generators
   // ======================================================
   
   always begin
      tst_cpuclk <= 0;
      #20.01;
      tst_cpuclk <= 1;
      #20.01;
   end
   always begin
      tst_clk48 <= 0;
      #10.41666666;
      tst_clk48 <= 1;
      #10.41666666;
   end

endmodule
