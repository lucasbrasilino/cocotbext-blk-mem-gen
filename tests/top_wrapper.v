`timescale 1ns/1ps
module top_wrapper #(
        parameter integer C_M_AXI_THREAD_ID_WIDTH       = 3,
        parameter integer C_M_AXI_ADDR_WIDTH            = 16,
        parameter integer C_M_AXI_DATA_WIDTH            = 32,
        parameter integer C_M_AXI_BUSER_WIDTH           = 1
        ) (
        input wire                  aclk,
        input wire                  areset,

        // master interface write address
        output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]     m_axi_awid,
        output wire [C_M_AXI_ADDR_WIDTH-1:0]          m_axi_awaddr,
        output wire [7:0]                             m_axi_awlen,
        output wire [2:0]                             m_axi_awsize,
        output wire [1:0]                             m_axi_awburst,
        output wire [0:0]                             m_axi_awlock,
        output wire [3:0]                             m_axi_awcache,
        output wire [2:0]                             m_axi_awprot,
        output wire [3:0]                             m_axi_awqos,
        output wire [3:0]                             m_axi_awregion,
        output wire [15:0]                            m_axi_awuser,
        output wire                                   m_axi_awvalid,
        input  wire                                   m_axi_awready,

        // master interface write data
        output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]     m_axi_wid,
        output wire [C_M_AXI_DATA_WIDTH-1:0]          m_axi_wdata,
        output wire [C_M_AXI_DATA_WIDTH/8-1:0]        m_axi_wstrb,
        output wire                                   m_axi_wlast,
        output wire                                   m_axi_wvalid,
        input  wire                                   m_axi_wready,

        // master interface write response
        input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]     m_axi_bid,
        input  wire [1:0]                             m_axi_bresp,
        input  wire                                   m_axi_bvalid,
        output wire                                   m_axi_bready,

        // master interface read address
        output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]     m_axi_arid,
        output wire [C_M_AXI_ADDR_WIDTH-1:0]          m_axi_araddr,
        output wire [7:0]                             m_axi_arlen,
        output wire [2:0]                             m_axi_arsize,
        output wire [1:0]                             m_axi_arburst,
        output wire [0:0]                             m_axi_arlock,
        output wire [3:0]                             m_axi_arcache,
        output wire [2:0]                             m_axi_arprot,
        output wire [3:0]                             m_axi_arqos,
        output wire [3:0]                             m_axi_arregion,
        output wire [15:0]                            m_axi_aruser,
        output wire                                   m_axi_arvalid,
        input  wire                                   m_axi_arready,

        // master interface read data
        input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]     m_axi_rid,
        input  wire [C_M_AXI_DATA_WIDTH-1:0]          m_axi_rdata,
        input  wire [1:0]                             m_axi_rresp,
        input  wire                                   m_axi_rlast,
        input  wire                                   m_axi_rvalid,
        output wire                                   m_axi_rready
        );


endmodule


